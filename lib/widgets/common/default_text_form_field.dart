import 'package:ytnkio/core_module.dart';

class DefaultTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String helperText;
  final String labelText;
  final IconData icon;
  final TextInputType keyboardType;
  final int? maxLines;
  final bool? enabled;

  final bool? obscureText;

  final String? Function(String?)? validator;

  final FocusNode? focusNode;
  final Function? onFieldSubmitted;

  const DefaultTextFormField({
    super.key,
    required this.controller,
    required this.helperText,
    required this.labelText,
    required this.icon,
    required this.keyboardType,
    this.maxLines,
    this.obscureText,
    this.validator,
    this.focusNode,
    this.onFieldSubmitted,
    this.enabled,
  });

  @override
  Widget build(context) {
    return TextFormField(
      maxLines: maxLines ?? 1,
      cursorColor: GlobalConstants.defaultTextColor,
      style: const TextStyle(color: GlobalConstants.defaultTextColor),
      decoration: InputDecoration(
        icon: Icon(icon, color: GlobalConstants.defaultTextColor),
        helperText: helperText,
        labelText: labelText,
      ),
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      validator: validator,
      focusNode: focusNode,
      enabled: enabled ?? true,
      onFieldSubmitted: (value) {
        if (onFieldSubmitted != null) {
          onFieldSubmitted!();
        }
      },
    );
  }
}
