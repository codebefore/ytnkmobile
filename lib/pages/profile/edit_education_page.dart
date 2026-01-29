import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/profile/education.dart';
import 'package:ytnkio/models/common/organisation.dart';
import 'package:ytnkio/services/common/id_generator.dart';
import 'package:ytnkio/widgets/common/default_dropdown_button.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';

class EditEducationPage extends StatefulWidget {
  static const id = "/pages/profile/edit_education_page";
  final Education? education;

  const EditEducationPage({super.key, this.education});

  @override
  State<EditEducationPage> createState() => _EditEducationPageState();
}

class _EditEducationPageState extends State<EditEducationPage> {
  late String id;
  late String startedOnMonth;
  late String endedOnMonth;
  late String startedOnYear;
  late String endedOnYear;

  late bool isCurrent;

  final gradeController = TextEditingController();
  final degreeController = TextEditingController();
  final organisationController = TextEditingController();
  final fieldsOfStudyController = TextEditingController();
  final descriptionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _initializeForm();
  }

  void _initializeForm() {
    if (widget.education == null) {
      id = IDGenerator.generateObjectId();
      startedOnYear = (DateTime.now().year - 1).toString();
      startedOnMonth = GlobalTexts.current.MONTHS[0];
      endedOnYear = DateTime.now().year.toString();
      endedOnMonth = GlobalTexts.current.MONTHS[0];
      isCurrent = true;
    } else {
      id = widget.education!.id;
      _fillFormFields();
    }
  }

  void _fillFormFields() {
    organisationController.text = widget.education!.school.name;
    degreeController.text = widget.education!.degree;
    fieldsOfStudyController.text = widget.education!.fieldsOfStudy!.join(",");
    gradeController.text = widget.education!.grade;
    descriptionController.text = widget.education!.description;
    startedOnYear = widget.education!.startedOnYear;
    startedOnMonth = widget.education!.startedOnMonth;
    endedOnYear = widget.education!.endedOnYear;
    endedOnMonth = widget.education!.endedOnMonth;
    isCurrent = widget.education!.isCurrent;
  }

  @override
  void didUpdateWidget(covariant EditEducationPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.education != oldWidget.education && widget.education != null) {
      _fillFormFields();
    }
  }

  @override
  void dispose() {
    gradeController.dispose();
    degreeController.dispose();
    organisationController.dispose();
    fieldsOfStudyController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  Education populateEducation() {
    return Education(
        id: id,
        school: Organisation(
          name: organisationController.text,
          socialAccounts: [],
        ),
        degree: degreeController.text,
        grade: gradeController.text,
        startedOnMonth: startedOnMonth,
        startedOnYear: startedOnYear,
        endedOnMonth: endedOnMonth,
        endedOnYear: endedOnYear,
        isCurrent: isCurrent,
        description: descriptionController.text,
        fieldsOfStudy: fieldsOfStudyController.text.split(","));
  }

  void save(profileId, Education education) {
    education = Education(
        id: education.id,
        school: Organisation(
          name: organisationController.text,
          socialAccounts: [],
        ),
        degree: degreeController.text,
        grade: gradeController.text,
        startedOnMonth: startedOnMonth,
        startedOnYear: startedOnYear,
        endedOnMonth: endedOnMonth,
        endedOnYear: endedOnYear,
        isCurrent: isCurrent,
        description: descriptionController.text,
        fieldsOfStudy: education.fieldsOfStudy);

    context.read<GlobalBloc>().add(UpdateEducationEvent(profileId, education));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.EDITEDUCATION_PAGE_title,
      appBar: DefaultAppBar(
        actions: [
          IconButton(
            icon: const Icon(GlobalIcons.GENERAL_deleteIcon),
            onPressed: () async {
              if (widget.education != null) {
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(GlobalTexts.current
                              .EDITEDUCATION_PAGE_deleteConfirmationTitle),
                          content: Text(GlobalTexts
                              .current.EDITEDUCATION_PAGE_deleteConfirmation),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(GlobalTexts
                                  .current.EDITEDUCATION_PAGE_deleteCancel),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<GlobalBloc>().add(
                                    DeleteEducationEvent(widget.education!.id));

                                Navigator.pop(context);
                              },
                              child: Text(GlobalTexts
                                  .current.EDITEDUCATION_PAGE_delete),
                            ),
                          ],
                        ));
              }
            },
          ),
        ],
      ),
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            switch (state.lastOperation) {
              case Operations.deleteEducation:
                if (state.isSuccessful) {
                  EasyLoading.showSuccess(
                      GlobalTexts.current.EDITEDUCATION_PAGE_deleteSuccess);

                  Navigator.pop(context);
                } else {
                  EasyLoading.showError(
                      GlobalTexts.current.EDITEDUCATION_PAGE_deleteError);
                }

                break;
              case Operations.editEducation:
                if (state.isSuccessful) {
                  EasyLoading.showSuccess(
                      GlobalTexts.current.EDITEDUCATION_PAGE_saveSuccess);

                  Navigator.pop(context);
                } else {
                  EasyLoading.showError(
                      GlobalTexts.current.EDITEDUCATION_PAGE_saveError);
                }

                break;
              default:
            }
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Form(
            key: _formKey, // wrapping form
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextFormField(
                  controller: organisationController,
                  helperText: "Ex: Harvard University",
                  labelText: "School",
                  icon: Icons.school_rounded,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: degreeController,
                  helperText: "Ex: Bachelor of Science",
                  labelText: "Degree",
                  icon: Icons.grade,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: fieldsOfStudyController,
                  labelText: "Fields of Study",
                  helperText: "Ex: Computer Science",
                  icon: Icons.library_books,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                DefaultTextFormField(
                  controller: gradeController,
                  labelText: "Grade",
                  helperText: "Ex: 3.5, AA, A+",
                  icon: Icons.leaderboard,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: DefaultDropdownButton<String>(
                        icon: const Icon(Icons.calendar_month),
                        hint: "Start Month",
                        value: startedOnMonth,
                        onChanged: (String? newValue) {
                          setState(() {
                            startedOnMonth = newValue.toString();
                          });
                        },
                        firstItem: "",
                        items: GlobalTexts.current.MONTHS,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: DefaultDropdownButton<String>(
                        icon: const Icon(Icons.date_range),
                        hint: "Start Year",
                        value: startedOnYear,
                        onChanged: (String? newValue) {
                          setState(() {
                            startedOnYear = newValue.toString();
                          });
                        },
                        items: GlobalTexts.current.YEARSBEFORE,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: DefaultDropdownButton<String>(
                          icon: const Icon(Icons.calendar_month),
                          hint: "End Month",
                          value: endedOnMonth,
                          onChanged: (String? newValue) {
                            setState(() {
                              endedOnMonth = newValue.toString();
                            });
                          },
                          items: GlobalTexts.current.MONTHS),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: DefaultDropdownButton<String>(
                        icon: const Icon(Icons.date_range),
                        hint: "End Year",
                        value: endedOnYear,
                        onChanged: (String? newValue) {
                          setState(() {
                            endedOnYear = newValue.toString();
                          });
                        },
                        items: GlobalTexts.current.YEARSBEFOREAFTER,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                DefaultTextFormField(
                  maxLines: 2,
                  controller: descriptionController,
                  labelText: "Description",
                  helperText: "",
                  icon: Icons.description,
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: DefaultElevatedButton(
                      isProcessing: state.isProcessing,
                      icon: GlobalIcons.GENERAL_saveIcon,
                      label: GlobalTexts.current.EDITEDUCATION_PAGE_save,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          save(state.profile.id, populateEducation());
                        }
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
