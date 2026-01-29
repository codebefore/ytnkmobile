import 'package:go_router/go_router.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/pages/survey/start_survey_page.dart';
import 'package:ytnkio/widgets/dashboard/action_card.dart';
import 'package:ytnkio/widgets/dashboard/badge_card.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/dashboard/jumbo_card.dart';
import 'package:ytnkio/widgets/dashboard/profile_progress_viewer.dart';
import 'package:ytnkio/widgets/dashboard/recommended_jobs.dart';
import 'package:ytnkio/widgets/dashboard/rss_feed.dart';
import 'package:ytnkio/widgets/dashboard/tabbed_list.dart';

class DashboardPage extends StatelessWidget {
  static const id = "/pages/dashboard/dashboard_page";

  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      title: GlobalTexts.current.DASHBOARD_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Center(
              child: ListView(
                children: <Widget>[
                  //PROFILE PROGRESS
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: ProfileProgressViewer(),
                  ),

                  //ACTION CARDS
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: ActionCard(
                            name: GlobalTexts.current.DASHBOARD_PAGE_fillSurvey,
                            icon: Icons.people_alt_outlined,
                            header: GlobalTexts
                                .current.DASHBOARD_PAGE_fillSurveyHeader,
                            description: GlobalTexts
                                .current.DASHBOARD_PAGE_fillSurveyDescription,
                            color: const Color.fromARGB(255, 151, 211, 195),
                            action: () {
                              context.push(StartSurveyPage.id);
                            },
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: ActionCard(
                            name: GlobalTexts.current.DASHBOARD_PAGE_showTests,
                            icon: Icons.military_tech,
                            header: GlobalTexts
                                .current.DASHBOARD_PAGE_showTestsHeader,
                            description: GlobalTexts
                                .current.DASHBOARD_PAGE_showTestsDescription,
                            color: const Color.fromARGB(255, 141, 153, 255),
                            action: () {
                              context.push(StartSurveyPage.id);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  //RSS FEED
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: RSSFeed(),
                  ),

                  //BADGE CARDS
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          child: BadgeCard(
                            number: 1,
                            definition: "Appeared to Recruiters",
                            iconData: Icons.supervised_user_circle_outlined,
                            iconForeColor: Colors.orange.shade700,
                            iconBackColor: Colors.orange.shade100,
                          ),
                        ),
                        Flexible(
                          child: BadgeCard(
                            number: 2,
                            definition: "Recruiter Actions",
                            iconData: Icons.phone_callback_rounded,
                            iconForeColor: Colors.blue.shade900,
                            iconBackColor: Colors.blue.shade100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Flex(
                      direction: Axis.horizontal,
                      children: [
                        Flexible(
                          child: BadgeCard(
                            number: 8,
                            definition: "Messages",
                            iconData: Icons.mark_email_read_outlined,
                            iconForeColor: Colors.purple.shade900,
                            iconBackColor: Colors.purple.shade100,
                          ),
                        ),
                        Flexible(
                          child: BadgeCard(
                            number: 3,
                            definition: "Job Alerts",
                            iconData: Icons.message_outlined,
                            iconForeColor: Colors.green.shade900,
                            iconBackColor: Colors.green.shade100,
                          ),
                        ),
                      ],
                    ),
                  ),
                  JumboCard(
                      image: "lib/assets/images/plan.png",
                      header: "Plan your next carrier move",
                      name: "Explore now",
                      action: () {},
                      foreColor: Colors.indigo,
                      backColor: Colors.white),
                  TabbedList(
                    header: "Jobs for you",
                    viewAllText: "View all jobs",
                    viewAllAction: () {},
                    tabNames: const [
                      "Flash Opening",
                      "Recommended",
                      "Job Alerts"
                    ],
                    contents: [
                      RecommendedJobs(
                        icon: Icons.filter_list_off_rounded,
                        description:
                            "No activity on your profile right now. \nCheck out recommended jobs.",
                        color: Colors.purple,
                        name: "View Recommended Jobs",
                        action: () {},
                      ),
                      RecommendedJobs(
                        icon: Icons.fiber_smart_record_outlined,
                        description:
                            "No recommended job for your profile right now. \nCheck out recommended jobs.",
                        color: Colors.orange,
                        name: "Show me the jobs",
                        action: () {},
                      ),
                      RecommendedJobs(
                        icon: Icons.alternate_email,
                        description:
                            "Job alerts. \nCheck out recommended jobs.",
                        color: Colors.red,
                        name: "View Recommended Jobs",
                        action: () {},
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  )
                ],
              ),
            );
          }),
    );
  }
}
