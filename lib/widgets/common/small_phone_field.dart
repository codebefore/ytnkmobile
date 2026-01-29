import 'package:ytnkio/core_module.dart';

class SmallPhoneField extends StatelessWidget {
  final TextEditingController controller;
  final String helperText;
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;

  final bool? obscureText;

  const SmallPhoneField({
    super.key,
    required this.controller,
    required this.helperText,
    required this.labelText,
    required this.icon,
    required this.keyboardType,
    this.obscureText,
  });

  @override
  Widget build(context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: DropdownButtonFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(13),
                icon: Icon(icon, color: GlobalConstants.defaultTextColor),
                helperText: "",
                labelText: "Code",
                labelStyle: const TextStyle(
                    color: GlobalConstants.defaultTextColor, fontSize: 18),
                border: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: GlobalConstants.defaultBorderColor),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(color: GlobalConstants.defaultBorderColor),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: GlobalConstants.defaultErrorBorderColor, width: 2),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: GlobalConstants.defaultBorderColor, width: 2),
                ),
                fillColor: GlobalConstants.defaultPageColor,
                filled: true,
              ),
              items: const [
                DropdownMenuItem(
                  value: "+90",
                  child: Text("+90"),
                ),
                DropdownMenuItem(
                  value: "+1",
                  child: Text("+1"),
                ),
                DropdownMenuItem(
                  value: "+44",
                  child: Text("+44"),
                ),
              ],
              onChanged: (value) {}),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
            cursorColor: GlobalConstants.defaultTextColor,
            style: const TextStyle(
                color: GlobalConstants.defaultTextColor, fontSize: 12),
            decoration: InputDecoration(
              helperText: helperText,
              labelText: labelText,
              labelStyle: const TextStyle(
                  color: GlobalConstants.defaultTextColor, fontSize: 18),
              border: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: GlobalConstants.defaultBorderColor),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: GlobalConstants.defaultBorderColor),
              ),
              focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: GlobalConstants.defaultErrorBorderColor, width: 2),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    color: GlobalConstants.defaultBorderColor, width: 2),
              ),
              fillColor: GlobalConstants.defaultPageColor,
              filled: true,
            ),
            controller: controller,
            keyboardType: keyboardType,
            obscureText: obscureText ?? false,
            obscuringCharacter: "*",
          ),
        ),
      ],
    );
  }
}
