import 'package:ytnkio/core_module.dart';

class SmallTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String helperText;
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;

  final bool? obscureText;
  final bool? enabled;

  const SmallTextFormField({
    super.key,
    required this.controller,
    required this.helperText,
    required this.labelText,
    required this.icon,
    required this.keyboardType,
    this.obscureText,
    this.enabled,
  });

  @override
  Widget build(context) {
    return TextFormField(
      enabled: enabled,
      cursorColor: GlobalConstants.defaultTextColor,
      style: const TextStyle(
          color: GlobalConstants.defaultTextColor, fontSize: 12),
      decoration: InputDecoration(
        icon: Icon(icon, color: GlobalConstants.defaultTextColor),
        helperText: helperText,
        labelText: labelText,
        labelStyle: const TextStyle(
            color: GlobalConstants.defaultTextColor, fontSize: 18),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: GlobalConstants.defaultBorderColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: GlobalConstants.defaultBorderColor),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: GlobalConstants.defaultErrorBorderColor, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide:
              BorderSide(color: GlobalConstants.defaultBorderColor, width: 2),
        ),
        fillColor: GlobalConstants.defaultPageColor,
        filled: true,
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
    );
  }
}
