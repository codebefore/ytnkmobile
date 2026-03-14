import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/blocs/global/global_bloc.dart';
import 'package:ytnkio/globals/global_texts.dart';
import 'package:ytnkio/models/match/match.dart';
import 'package:ytnkio/widgets/common/default_scaffold.dart';
import 'package:ytnkio/widgets/match/match_card.dart';

class MatchesPage extends StatefulWidget {
  static const id = "/pages/match/matches_page";

  const MatchesPage({super.key});

  @override
  State<MatchesPage> createState() => _MatchesPageState();
}

class _MatchesPageState extends State<MatchesPage> {
  List<Match> matches = [];

  @override
  Widget build(BuildContext context) {
    final allMatches = context.watch<GlobalBloc>().state.matches;
    matches = allMatches.where((match) {
      final status = match.status.toLowerCase();
      return status != "created";
    }).toList();

    return DefaultScaffold(
      title: GlobalTexts.current.MATCHINGS_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) => ListView(
          children: [
            Text(
                "${GlobalTexts.current.MATCHINGS_PAGE_matchingSummaryA}${matches.length}${GlobalTexts.current.MATCHINGS_PAGE_matchingSummaryB}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(GlobalTexts.current.MATCHINGS_PAGE_matchingSummaryHint,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.normal)),
            const SizedBox(height: 16),
            ...matches.map((item) => MatchCard(match: item)),
          ],
        ),
      ),
    );
  }
}
