import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';
import 'package:ytnkio/widgets/common/card_header.dart';

class ProfileSection extends StatelessWidget {
  final String cardTitle;
  final Function()? onEditCallback;
  final Widget body;
  final bool isProcessing;

  const ProfileSection({
    super.key,
    required this.cardTitle,
    this.onEditCallback,
    required this.body,
    required this.isProcessing,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      color: Colors.white,
      colorOpacity: 0.8,
      enabled: isProcessing,
      duration: const Duration(seconds: 4),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          color: Colors.white,
          child: Column(children: [
            CardHeader(
                text: cardTitle,
                showEditButton: onEditCallback != null,
                onEditCallback: onEditCallback),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: body,
            ),
          ]),
        ),
      ),
    );
  }
}
