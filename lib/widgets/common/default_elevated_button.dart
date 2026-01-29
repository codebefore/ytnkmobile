import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ytnkio/globals/global_constants.dart';

class DefaultElevatedButton extends StatelessWidget {
  final bool isProcessing;
  final IconData icon;
  final String label;
  final Function()? onPressed;
  final Color? backgroundColor;

  const DefaultElevatedButton(
      {super.key,
      required this.isProcessing,
      required this.icon,
      required this.label,
      this.onPressed,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Colors.white,
      colorOpacity: 0.8,
      enabled: isProcessing,
      duration: const Duration(seconds: 4),
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(label),
        style: ButtonStyle(
          textStyle: const WidgetStatePropertyAll(
              TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: WidgetStatePropertyAll(isProcessing
              ? GlobalConstants.passiveButtonColor
              : backgroundColor ?? GlobalConstants.defaultButtonColor),
          foregroundColor: const WidgetStatePropertyAll(
              GlobalConstants.defaultButtonTextColor),
          elevation: const WidgetStatePropertyAll(0),
          shadowColor: const WidgetStatePropertyAll(Colors.grey),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        onPressed: isProcessing ? null : onPressed,
      ),
    );
  }
}
