import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_icons.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/profile/skill.dart';
import 'package:ytnkio/widgets/common/default_elevated_button.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/common/stars.dart';

class EditSkillPage extends StatefulWidget {
  static const id = "/pages/profile/edit_skill_page";

  final Skill skill;

  const EditSkillPage({super.key, required this.skill});

  @override
  State<EditSkillPage> createState() => _EditSkillPageState();
}

class _EditSkillPageState extends State<EditSkillPage> {
  late String id;
  late String name;
  late String text;
  late int point;

  @override
  void initState() {
    super.initState();

    id = widget.skill.id;
    name = widget.skill.name;
    text = widget.skill.text;
    point = widget.skill.point;
  }

  Skill populateSkill() {
    return Skill(id: id, name: name, text: text, point: point);
  }

  void save(profileId, Skill skill) {
    skill = Skill(id: id, name: name, text: text, point: point);

    context.read<GlobalBloc>().add(UpdateSkillEvent(profileId, skill));
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
              if (widget.skill.name.isEmpty) return;

              await showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(GlobalTexts
                            .current.EDITSKILL_PAGE_deleteConfirmationTitle),
                        content: Text(GlobalTexts
                            .current.EDITSKILL_PAGE_deleteConfirmation),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(GlobalTexts
                                .current.EDITSKILL_PAGE_deleteCancel),
                          ),
                          TextButton(
                            onPressed: () {
                              context
                                  .read<GlobalBloc>()
                                  .add(DeleteSkillEvent(widget.skill.id));

                              Navigator.pop(context);
                            },
                            child:
                                Text(GlobalTexts.current.EDITSKILL_PAGE_delete),
                          ),
                        ],
                      ));
            },
          ),
        ],
      ),
      title: GlobalTexts.current.EDITSKILL_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {
          if (!state.isProcessing) {
            if (state.isFailure) {
              EasyLoading.showError(state.infoMessage);

              return;
            }

            if (state.lastOperation == Operations.deleteSkill) {
              EasyLoading.showSuccess(
                  GlobalTexts.current.EDITSKILL_PAGE_deleteSuccess);

              Navigator.pop(context);
            } else if (state.lastOperation == Operations.editSkill) {
              EasyLoading.showSuccess(
                  GlobalTexts.current.EDITSKILL_PAGE_saveSuccess);

              Navigator.pop(context);
            }
          }
        },
        builder: (context, state) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(GlobalTexts
                  .current.EDITSKILL_PAGE_selectYourProficiencyLevel),
              const SizedBox(height: 10),
              Card(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      selected: point == 20,
                      selectedTileColor: Colors.indigo,
                      selectedColor: Colors.white,
                      title: Row(
                        children: [
                          Text(GlobalTexts.current.EDITSKILL_PAGE_level1Title),
                          const Stars(starCount: 1)
                        ],
                      ),
                      dense: true,
                      subtitle: Text(
                          GlobalTexts.current.EDITSKILL_PAGE_level1Description),
                      onTap: () {
                        setState(() {
                          point = 20;
                        });
                      },
                    ),
                    ListTile(
                      selected: point == 40,
                      selectedTileColor: Colors.indigo,
                      selectedColor: Colors.white,
                      title: Row(
                        children: [
                          Text(GlobalTexts.current.EDITSKILL_PAGE_level2Title),
                          const Stars(starCount: 2)
                        ],
                      ),
                      dense: true,
                      subtitle: Text(
                          GlobalTexts.current.EDITSKILL_PAGE_level2Description),
                      onTap: () {
                        setState(() {
                          point = 40;
                        });
                      },
                    ),
                    ListTile(
                      selected: point == 60,
                      selectedTileColor: Colors.indigo,
                      selectedColor: Colors.white,
                      title: Row(
                        children: [
                          Text(GlobalTexts.current.EDITSKILL_PAGE_level3Title),
                          const Stars(starCount: 3)
                        ],
                      ),
                      dense: true,
                      subtitle: Text(
                          GlobalTexts.current.EDITSKILL_PAGE_level3Description),
                      onTap: () {
                        setState(() {
                          point = 60;
                        });
                      },
                    ),
                    ListTile(
                      selected: point == 80,
                      selectedTileColor: Colors.indigo,
                      selectedColor: Colors.white,
                      title: Row(
                        children: [
                          Text(GlobalTexts.current.EDITSKILL_PAGE_level4Title),
                          const Stars(starCount: 4)
                        ],
                      ),
                      dense: true,
                      subtitle: Text(
                          GlobalTexts.current.EDITSKILL_PAGE_level4Description),
                      onTap: () {
                        setState(() {
                          point = 80;
                        });
                      },
                    ),
                    ListTile(
                      selected: point == 100,
                      selectedTileColor: Colors.indigo,
                      selectedColor: Colors.white,
                      title: Row(
                        children: [
                          Text(GlobalTexts.current.EDITSKILL_PAGE_level5Title),
                          const Stars(starCount: 5)
                        ],
                      ),
                      dense: true,
                      subtitle: Text(
                          GlobalTexts.current.EDITSKILL_PAGE_level5Description),
                      onTap: () {
                        setState(() {
                          point = 100;
                        });
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: DefaultElevatedButton(
                  isProcessing: state.isProcessing,
                  icon: GlobalIcons.GENERAL_saveIcon,
                  label: GlobalTexts.current.EDITSKILL_PAGE_save,
                  onPressed: () {
                    save(state.profile.id, populateSkill());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
