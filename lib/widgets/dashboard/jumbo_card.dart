import 'package:ytnkio/core_module.dart';

class JumboCard extends StatelessWidget {
  final String image;
  final String header;
  final Color foreColor;
  final Color backColor;
  final String name;
  final Function action;

  const JumboCard({
    super.key,
    required this.image,
    required this.header,
    required this.name,
    required this.action,
    required this.foreColor,
    required this.backColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2.0),
      ),
      surfaceTintColor: backColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    header,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  OutlinedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              const WidgetStatePropertyAll(Colors.white),
                          backgroundColor: WidgetStatePropertyAll(foreColor)),
                      onPressed: () {
                        action.call();
                      },
                      child: Text(name)),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Image.asset(
                image,
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
