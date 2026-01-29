import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/common/organisation.dart';
import 'package:ytnkio/models/profile/work_experience.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/widgets/common/autocomplete_text_form_field.dart';
import 'package:ytnkio/widgets/common/default_dropdown_button.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/services/common/id_generator.dart';
import 'package:ytnkio/widgets/common/default_text_form_field.dart';

class EditWorkExperiencePage extends StatefulWidget {
  static const id = "/pages/profile/edit_job_experience_page";
  final WorkExperience? workExperience;

  const EditWorkExperiencePage({super.key, this.workExperience});

  @override
  State<EditWorkExperiencePage> createState() => _EditWorkExperiencePageState();
}

class _EditWorkExperiencePageState extends State<EditWorkExperiencePage> {
  late String id;
  late String workType;
  late String startedOnYear;
  late String startedOnMonth;
  late String endedOnYear;
  late String endedOnMonth;
  late bool isCurrent;

  final titleController = TextEditingController();
  final organisationController = TextEditingController();
  final locationController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.workExperience == null) {
      id = IDGenerator.generateObjectId();
      workType = "";
      startedOnYear = "";
      startedOnMonth = "";
      endedOnYear = "";
      endedOnMonth = "";
      isCurrent = true;
    } else {
      id = widget.workExperience!.id;
      titleController.text = widget.workExperience!.title;
      workType = widget.workExperience!.workType;
      organisationController.text = widget.workExperience!.organisation.name;
      locationController.text = widget.workExperience!.location;
      descriptionController.text = widget.workExperience!.description;
      startedOnYear = widget.workExperience!.startedOnYear;
      startedOnMonth = widget.workExperience!.startedOnMonth;
      endedOnYear = widget.workExperience!.endedOnYear;
      endedOnMonth = widget.workExperience!.endedOnMonth;
      isCurrent = widget.workExperience!.isCurrent;
    }
  }

  WorkExperience populateWorkExperience() {
    return WorkExperience(
        id: id,
        organisation: Organisation(
          name: organisationController.text,
          socialAccounts: [],
        ),
        title: titleController.text,
        workType: workType,
        description: descriptionController.text,
        location: locationController.text,
        startedOnYear: startedOnYear,
        startedOnMonth: startedOnMonth,
        endedOnYear: endedOnYear,
        endedOnMonth: endedOnMonth,
        isCurrent: isCurrent);
  }

  void save(profileId, WorkExperience workExperience) {
    workExperience = WorkExperience(
        id: workExperience.id,
        organisation: Organisation(
          name: organisationController.text,
          socialAccounts: [],
        ),
        title: titleController.text,
        workType: workType,
        description: descriptionController.text,
        location: locationController.text,
        startedOnYear: startedOnYear,
        startedOnMonth: startedOnMonth,
        endedOnYear: endedOnYear,
        endedOnMonth: endedOnMonth,
        isCurrent: isCurrent);

    context
        .read<GlobalBloc>()
        .add(UpdateWorkExperienceEvent(profileId, workExperience));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_title,
      appBar: DefaultAppBar(
        actions: [
          IconButton(
            icon: const Icon(GlobalIcons.GENERAL_deleteIcon),
            onPressed: () async {
              if (widget.workExperience != null) {
                await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(GlobalTexts.current
                              .EDITWORKEXPERIENCE_PAGE_deleteConfirmationTitle),
                          content: Text(GlobalTexts.current
                              .EDITWORKEXPERIENCE_PAGE_deleteConfirmation),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(GlobalTexts.current
                                  .EDITWORKEXPERIENCE_PAGE_deleteCancel),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<GlobalBloc>().add(
                                    DeleteWorkExperienceEvent(
                                        widget.workExperience!.id));

                                Navigator.pop(context);
                              },
                              child: Text(GlobalTexts
                                  .current.EDITWORKEXPERIENCE_PAGE_delete),
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
              case Operations.deleteWorkExperience:
                if (state.isSuccessful) {
                  EasyLoading.showSuccess(GlobalTexts
                      .current.EDITWORKEXPERIENCE_PAGE_deleteSuccess);

                  Navigator.pop(context);
                } else {
                  EasyLoading.showError(
                      GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_deleteError);
                }

                break;
              case Operations.editWorkExperience:
                if (state.isSuccessful) {
                  EasyLoading.showSuccess(
                      GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_saveSuccess);

                  Navigator.pop(context);
                } else {
                  EasyLoading.showError(
                      GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_saveError);
                }

                break;
              default:
            }
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AutocompleteTextFormField(
                labelText:
                    GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_titleLabel,
                helperText:
                    GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_titleLabel,
                icon: GlobalIcons.EDITWORKEXPERIENCE_PAGE_jobTitleIcon,
                keyboardType: TextInputType.text,
                searchList: "jobTitles",
                controller: titleController,
              ),
              const SizedBox(height: 10),
              DefaultDropdownButton<String>(
                value: workType,
                onChanged: (String? newValue) {
                  setState(() {
                    workType = newValue ?? "";
                  });
                },
                firstItem: "",
                items: GlobalTexts.current.WORKTYPES,
                hint: GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_workType,
                icon: const Icon(
                    GlobalIcons.EDITWORKEXPERIENCE_PAGE_workTypeIcon),
              ),
              const SizedBox(height: 10),
              AutocompleteTextFormField(
                labelText:
                    GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_organisation,
                helperText:
                    GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_organisation,
                icon: GlobalIcons.EDITWORKEXPERIENCE_PAGE_organisationIcon,
                keyboardType: TextInputType.text,
                searchList: "organisations",
                controller: organisationController,
              ),
              const SizedBox(height: 10),
              AutocompleteTextFormField(
                labelText: GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_location,
                helperText:
                    GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_location,
                icon: GlobalIcons.GENERAL_locationIcon,
                keyboardType: TextInputType.text,
                searchList: "cities",
                controller: locationController,
              ),
              const SizedBox(height: 10),
              CheckboxListTile(
                controlAffinity: ListTileControlAffinity.leading,
                side: const BorderSide(color: Colors.grey),
                title: const Text("I am currently working in this role"),
                value: isCurrent,
                onChanged: (bool? value) {
                  setState(() {
                    isCurrent = value!;
                  });
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: DefaultDropdownButton<String>(
                        hint: "Started on month",
                        value: startedOnMonth,
                        onChanged: (String? newValue) {
                          setState(() {
                            startedOnMonth = newValue.toString();
                          });
                        },
                        firstItem: "",
                        items: GlobalTexts.current.MONTHS,
                        icon: const Icon(GlobalIcons.GENERAL_dateIcon)),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: DefaultDropdownButton<String>(
                      hint: "Started on year",
                      value: startedOnYear,
                      onChanged: (String? newValue) {
                        setState(() {
                          startedOnYear = newValue ?? "";
                        });
                      },
                      firstItem: "",
                      items: List.generate(20, (index) {
                        int year = DateTime.now().year - index;
                        return year.toString();
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              isCurrent
                  ? const SizedBox()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: DefaultDropdownButton<String>(
                            hint: "Ended on month",
                            value: endedOnMonth,
                            onChanged: (String? newValue) {
                              setState(() {
                                endedOnMonth = newValue ?? "";
                              });
                            },
                            firstItem: "",
                            items: GlobalTexts.current.MONTHS,
                            icon: const Icon(GlobalIcons.GENERAL_dateIcon),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: DefaultDropdownButton<String>(
                              hint: "Ended on year",
                              value: endedOnYear,
                              onChanged: (String? newValue) {
                                setState(() {
                                  endedOnYear = newValue ?? "";
                                });
                              },
                              firstItem: "",
                              items: List.generate(20, (index) {
                                int year = DateTime.now().year - index;
                                return year.toString();
                              })),
                        ),
                      ],
                    ),
              const SizedBox(
                height: 10,
              ),
              DefaultTextFormField(
                controller: descriptionController,
                maxLines: 2,
                helperText:
                    GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_description,
                labelText:
                    GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_description,
                icon: GlobalIcons.EDITWORKEXPERIENCE_PAGE_descriptionIcon,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: DefaultElevatedButton(
                    isProcessing: state.isProcessing,
                    icon: GlobalIcons.GENERAL_saveIcon,
                    label: GlobalTexts.current.EDITWORKEXPERIENCE_PAGE_save,
                    onPressed: () {
                      save(state.profile.id, populateWorkExperience());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
