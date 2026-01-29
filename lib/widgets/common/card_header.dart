import 'package:ytnkio/core_module.dart';
import 'package:ytnkio/widgets/common/edit_button.dart';

class CardHeader extends StatelessWidget {
  final String text;
  final bool showEditButton;
  final Function()? onEditCallback;

  const CardHeader(
      {super.key,
      required this.text,
      required this.showEditButton,
      required this.onEditCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "      $text",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          showEditButton
              ? EditButton(
                  onEditCallback: onEditCallback,
                )
              : const SizedBox(
                  width: 0,
                )
        ],
      ),
    );
  }
}
