import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ytnkio/globals/global_constants.dart';

class DefaultTextButton extends StatelessWidget {
  final bool isProcessing;
  final IconData? icon;
  final String label;
  final Function()? onPressed;

  const DefaultTextButton(
      {super.key,
      required this.isProcessing,
      required this.icon,
      required this.label,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Colors.white,
      colorOpacity: 0.8,
      enabled: isProcessing,
      duration: const Duration(seconds: 4),
      child: TextButton(
          onPressed: isProcessing ? null : onPressed,
          style: ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyle(
                fontWeight: FontWeight.bold,
                color: isProcessing
                    ? GlobalConstants.passiveButtonColor
                    : GlobalConstants.defaultButtonColor)),
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Icon(icon), Text(label)])),
    );
  }
}
