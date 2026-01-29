import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/match/match_accordion.dart';
import 'package:ytnkio/widgets/match/match_features.dart';
import 'package:ytnkio/widgets/match/match_header.dart';
import 'package:ytnkio/widgets/match/match_mini_features.dart';
import 'package:ytnkio/widgets/match/match_radar.dart';
import 'package:ytnkio/widgets/match/match_skill_cloud.dart';
import 'package:ytnkio/models/match/match.dart';

class MatchPage extends StatelessWidget {
  static const id = "/pages/match/match_page";

  const MatchPage({required this.match, super.key});

  final Match match;

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      isOnlyBack: true,
      title: GlobalTexts.current.MATCH_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) => Column(children: [
           Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  MatchHeader(match: match,),
                  SizedBox(height: 30),
                  MatchMiniFeatures(match: match,),
                  SizedBox(height: 30),
                  MatchFeatures(match: match,),
                  SizedBox(height: 30),
                  MatchRadar(match: match,),
                  SizedBox(height: 30),
                  MatchSkillCloud(match: match,),
                  SizedBox(height: 30),
                  MatchAccordion(match: match,),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all(const Size(100, 30)),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.green),
                        padding:
                            const WidgetStatePropertyAll(EdgeInsets.all(8)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                    child: Text(GlobalTexts.current.MATCH_PAGE_accept)),
                ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        minimumSize:
                            WidgetStateProperty.all(const Size(100, 30)),
                        foregroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.deepOrange),
                        padding:
                            const WidgetStatePropertyAll(EdgeInsets.all(8)),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                    child: Text(GlobalTexts.current.MATCH_PAGE_reject)),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
