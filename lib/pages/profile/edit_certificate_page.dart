import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/profile/certificate.dart';
import 'package:ytnkio/services/common/id_generator.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';

class EditCertificatePage extends StatefulWidget {
  static const id = "/pages/profile/edit_certificate_page";
  final Certificate? certificate;

  const EditCertificatePage({super.key, this.certificate});

  @override
  State<EditCertificatePage> createState() => _EditCertificatePageState();
}

class _EditCertificatePageState extends State<EditCertificatePage> {
  late String id;

  final certificateNameController = TextEditingController();
  final issuerController = TextEditingController();
  final certificateIdController = TextEditingController();
  final certificateUrlController = TextEditingController();
  final descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    if (widget.certificate == null) {
      id = IDGenerator.generateObjectId();
    } else {
      id = widget.certificate!.id;
      _fillFormFields();
    }
  }

  void _fillFormFields() {
    certificateNameController.text = widget.certificate!.name;
    issuerController.text = widget.certificate!.issuer;
    certificateIdController.text = widget.certificate!.certificateId;
    certificateUrlController.text = widget.certificate!.certificateUrl;
    descriptionController.text = widget.certificate!.description;
  }

  @override
  void didUpdateWidget(covariant EditCertificatePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.certificate != oldWidget.certificate &&
        widget.certificate != null) {
      _fillFormFields();
    }
  }

  @override
  void dispose() {
    certificateNameController.dispose();
    issuerController.dispose();
    certificateIdController.dispose();
    certificateUrlController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  Certificate populateCertificate() {
    return Certificate(
      id: id,
      name: certificateNameController.text,
      issuer: issuerController.text,
      certificateId: certificateIdController.text,
      certificateUrl: certificateUrlController.text,
      description: descriptionController.text,
    );
  }

  void save(profileId, Certificate certificate) {
    certificate = Certificate(
      id: certificate.id,
      name: certificateNameController.text,
      issuer: issuerController.text,
      certificateId: certificateIdController.text,
      certificateUrl: certificateUrlController.text,
      description: descriptionController.text,
    );

    context
        .read<GlobalBloc>()
        .add(UpdateCertificateEvent(profileId, certificate));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      appBar: DefaultAppBar(
        actions: [
          IconButton(
            icon: const Icon(GlobalIcons.GENERAL_deleteIcon),
            onPressed: () async {
              if (widget.certificate != null) {
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(GlobalTexts.current
                              .EDITCERTIFICATE_PAGE_deleteConfirmationTitle),
                          content: Text(GlobalTexts
                              .current.EDITCERTIFICATE_PAGE_deleteConfirmation),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(GlobalTexts
                                  .current.EDITCERTIFICATE_PAGE_deleteCancel),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<GlobalBloc>().add(
                                    DeleteCertificateEvent(
                                        widget.certificate!.id));

                                Navigator.pop(context);
                              },
                              child: Text(GlobalTexts
                                  .current.EDITCERTIFICATE_PAGE_delete),
                            ),
                          ],
                        ));
              }
            },
          ),
        ],
      ),
      title: GlobalTexts.current.EDITCERTIFICATE_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            switch (state.lastOperation) {
              case Operations.deleteCertificate:
                if (state.isSuccessful) {
                  EasyLoading.showSuccess(
                      GlobalTexts.current.EDITCERTIFICATE_PAGE_deleteSuccess);

                  Navigator.pop(context);
                } else {
                  EasyLoading.showError(
                      GlobalTexts.current.EDITCERTIFICATE_PAGE_deleteError);
                }

                break;
              case Operations.editCertificate:
                if (state.isSuccessful) {
                  EasyLoading.showSuccess(
                      GlobalTexts.current.EDITCERTIFICATE_PAGE_saveSuccess);

                  Navigator.pop(context);
                } else {
                  EasyLoading.showError(
                      GlobalTexts.current.EDITCERTIFICATE_PAGE_saveError);
                }

                break;
              default:
            }
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextFormField(
                    controller: certificateNameController,
                    helperText:
                        GlobalTexts.current.EDITCERTIFICATE_PAGE_nameHelper,
                    labelText: GlobalTexts.current.EDITCERTIFICATE_PAGE_name,
                    icon: GlobalIcons.EDITCERTIFICATE_PAGE_nameIcon,
                    keyboardType: TextInputType.text),
                DefaultTextFormField(
                    controller: issuerController,
                    helperText:
                        GlobalTexts.current.EDITCERTIFICATE_PAGE_issuerHelper,
                    labelText: GlobalTexts.current.EDITCERTIFICATE_PAGE_issuer,
                    icon: GlobalIcons.EDITCERTIFICATE_PAGE_issuerIcon,
                    keyboardType: TextInputType.text),
                DefaultTextFormField(
                    controller: certificateIdController,
                    helperText: GlobalTexts
                        .current.EDITCERTIFICATE_PAGE_certificateIdHelper,
                    labelText:
                        GlobalTexts.current.EDITCERTIFICATE_PAGE_certificateId,
                    icon: GlobalIcons.EDITCERTIFICATE_PAGE_certificateIdIcon,
                    keyboardType: TextInputType.text),
                DefaultTextFormField(
                    controller: certificateUrlController,
                    helperText: GlobalTexts
                        .current.EDITCERTIFICATE_PAGE_certificateUrlHelper,
                    labelText:
                        GlobalTexts.current.EDITCERTIFICATE_PAGE_certificateUrl,
                    icon: GlobalIcons.GENERAL_websiteIcon,
                    keyboardType: TextInputType.url),
                DefaultTextFormField(
                    controller: descriptionController,
                    helperText: GlobalTexts
                        .current.EDITCERTIFICATE_PAGE_descriptionHelper,
                    labelText:
                        GlobalTexts.current.EDITCERTIFICATE_PAGE_description,
                    icon: GlobalIcons.EDITCERTIFICATE_PAGE_descriptionIcon,
                    keyboardType: TextInputType.multiline,
                    maxLines: 5),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: DefaultElevatedButton(
                      isProcessing: state.isProcessing,
                      icon: GlobalIcons.GENERAL_saveIcon,
                      label: GlobalTexts.current.EDITCERTIFICATE_PAGE_save,
                      onPressed: () {
                        save(state.profile.id, populateCertificate());
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
