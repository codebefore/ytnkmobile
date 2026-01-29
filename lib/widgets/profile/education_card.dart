import 'package:go_router/go_router.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/models/profile/education.dart';
import 'package:ytnkio/pages/profile/edit_education_page.dart';
import 'package:ytnkio/widgets/common/edit_button.dart';

class EducationCard extends StatelessWidget {
  final Education education;
  final bool isLast;

  const EducationCard(
      {super.key, required this.education, required this.isLast});

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
                  education.isCurrent
                      ? const Text("...")
                      : Text(education.endedOnYear),
                  Text(education.startedOnYear),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        education.school.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis),
                      ),
                      Text(
                        education.degree,
                        style: const TextStyle(
                            color: Colors.grey, fontStyle: FontStyle.normal),
                      ),
                    ],
                  ),
                ),
              ),
              EditButton(
                onEditCallback: () {
                  context.push(EditEducationPage.id, extra: education);
                },
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          education.fieldsOfStudy != null && education.fieldsOfStudy!.isNotEmpty
              ? Text(education.fieldsOfStudy![0])
              : const SizedBox(),
          const SizedBox(
            height: 5,
          ),
          isLast ? const SizedBox() : const Divider()
        ],
      ),
    );
  }
}
