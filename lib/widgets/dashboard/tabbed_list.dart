import 'package:collection/collection.dart';
import 'package:ytnkio/core_module.dart';

class TabbedList extends StatefulWidget {
  final String header;
  final String viewAllText;
  final Function viewAllAction;
  final List<String> tabNames;
  final List<Widget> contents;

  const TabbedList({
    super.key,
    required this.header,
    required this.viewAllText,
    required this.viewAllAction,
    required this.tabNames,
    required this.contents,
  });

  @override
  State<TabbedList> createState() => _TabbedListState();
}

class _TabbedListState extends State<TabbedList> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DefaultTabController(
        length: widget.tabNames.length,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.header,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                TextButton(
                    onPressed: () {
                      widget.viewAllAction.call();
                    },
                    child: Text(widget.viewAllText)),
              ],
            ),
            TabBar(
              onTap: (value) {
                setState(() {
                  selectedTab = value;
                });
              },
              tabs: widget.tabNames
                  .mapIndexed((i, e) => Tab(
                        text: e,
                      ))
                  .toList(),
            ),
            Card(
              surfaceTintColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(2)),
              child: widget.contents[selectedTab],
            )
          ],
        ),
      ),
    );
  }
}
