import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/models/profile/work_experience.dart';
import 'package:ytnkio/pages/profile/edit_work_experience_page.dart';
import 'package:ytnkio/widgets/common/edit_button.dart';
import 'package:ytnkio/widgets/common/expandable_text.dart';

class WorkExperienceCard extends StatelessWidget {
  final WorkExperience experience;
  final bool isLast;

  const WorkExperienceCard(
      {super.key, required this.experience, required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  experience.isCurrent
                      ? const Text("...")
                      : Text(experience.endedOnYear),
                  Text(experience.startedOnYear),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(experience.organisation.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      Text(
                        "${experience.title} (${experience.workType})",
                        style: const TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
              ),
              EditButton(
                onEditCallback: () {
                  context.push(EditWorkExperiencePage.id, extra: experience);
                },
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          experience.location.isNotEmpty
              ? Text(experience.location)
              : const SizedBox(),
          const SizedBox(
            height: 5,
          ),
          ExpandableText(
              text: experience.description,
              maxLines: 4,
              fontSize: 14,
              expandFontSize: 14),
          isLast ? const SizedBox() : const Divider()
        ],
      ),
    );
  }
}
