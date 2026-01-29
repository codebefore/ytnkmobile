import 'package:flutter/material.dart';
import 'package:ytnkio/globals/global_icons.dart';

class EditButton extends StatelessWidget {
  final Function()? onEditCallback;

  const EditButton({super.key, required this.onEditCallback});

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      color: Colors.deepPurple,
      onPressed: onEditCallback,
      icon: const Icon(GlobalIcons.GENERAL_editIcon),
    );
  }
}
