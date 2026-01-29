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
  String filter = "all";
  List<Match> matches = [];

  @override
  Widget build(BuildContext context) {
    matches = context.watch<GlobalBloc>().state.matches;

    if (filter != "all") {
      matches = matches
          .where((element) => element.status == filter)
          .toList();
    }

    return DefaultScaffold(
      title: GlobalTexts.current.MATCHINGS_PAGE_title,
      body: BlocConsumer<GlobalBloc, GlobalState>(
        listener: (context, state) {},
        builder: (context, state) => ListView(
          children: [
            Text(
                "${GlobalTexts.current.MATCHINGS_PAGE_matchingSummaryA}${state.matches.length}${GlobalTexts.current.MATCHINGS_PAGE_matchingSummaryB}",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text(GlobalTexts.current.MATCHINGS_PAGE_matchingSummaryHint,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.normal)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(GlobalTexts.current.MATCHINGS_PAGE_filterBy,
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 12,
                        fontWeight: FontWeight.normal)),
                DropdownMenu<String>(
                    leadingIcon: null,
                    onSelected: (value) {
                      setState(() {
                        filter = value ?? "all";
                      });
                    },
                    inputDecorationTheme: const InputDecorationTheme(
                        contentPadding: EdgeInsets.all(4),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true),
                    initialSelection: "all",
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    menuStyle: MenuStyle(
                        visualDensity: VisualDensity.compact,
                        backgroundColor:
                            const WidgetStatePropertyAll(Colors.white),
                        elevation: const WidgetStatePropertyAll(8),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)))),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(value: "all", label: "All"),
                      DropdownMenuEntry(value: "accepted", label: "Accepted"),
                      DropdownMenuEntry(value: "rejected", label: "Rejected"),
                      DropdownMenuEntry(value: "referred", label: "Referred"),
                      DropdownMenuEntry(value: "waiting", label: "Waiting"),
                    ])
              ],
            ),
            const SizedBox(height: 16),
            ...matches.asMap().entries.map((e) => MatchCard(
                  match: e.value,
                  cardIndex: e.key,
                )),
          ],
        ),
      ),
    );
  }
}
