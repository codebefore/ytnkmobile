import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';

class EditAvatarPage extends StatefulWidget {
  static const id = "/pages/profile/edit_avatar_page";

  const EditAvatarPage({super.key});

  @override
  EditAvatarPageState createState() => EditAvatarPageState();
}

class EditAvatarPageState extends State<EditAvatarPage> {
  CroppedFile? _image;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      CroppedFile? croppedFile = (await ImageCropper().cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          ),
        ],
      ));

      if (croppedFile != null) {
        setState(() {
          _image = croppedFile;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.EDITAVATAR_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            if (state.lastOperation == Operations.editProfileAvatar) {
              if (state.isFailure) {
                EasyLoading.showError(state.infoMessage);
              }

              if (state.isSuccessful) {
                EasyLoading.showSuccess(
                    GlobalTexts.current.EDITAVATAR_PAGE_saveSuccess);

                GoRouter.of(context).pop();
              }
            }
          }
        },
        listenWhen: (previous, current) =>
            previous.isProcessing && !current.isProcessing,
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _image != null
                    ? Image.file(File(_image!.path))
                    : Text(GlobalTexts.current.EDITAVATAR_PAGE_noImageSelected),
                DefaultElevatedButton(
                  label: GlobalTexts.current.EDITAVATAR_PAGE_selectImage,
                  onPressed: _pickImage,
                  icon: GlobalIcons.EDITAVATAR_PAGE_selectIcon,
                  isProcessing: state.isProcessing,
                ),
                _image == null
                    ? SizedBox.fromSize(size: const Size(0, 0))
                    : DefaultElevatedButton(
                        label: GlobalTexts.current.EDITAVATAR_PAGE_uploadImage,
                        isProcessing: state.isProcessing,
                        icon: GlobalIcons.EDITAVATAR_PAGE_uploadIcon,
                        onPressed: () {
                          if (_image == null) return;

                          var file = File(_image!.path);
                          var fileLength = file.lengthSync();

                          if (fileLength > 1024 * 1024 * 4) {
                            EasyLoading.showInfo(
                                "${GlobalTexts.current.EDITAVATAR_PAGE_fileSizeLimitNotification} ${fileLength ~/ 1024}KB");

                            return;
                          }

                          context
                              .read<GlobalBloc>()
                              .add(UpdateAvatarEvent(state.profile.id, file));
                        },
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
