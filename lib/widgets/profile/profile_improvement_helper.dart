import 'package:flutter/material.dart';

class ProfileImprovementHelper extends StatelessWidget {
  const ProfileImprovementHelper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () => {},
            style: const ButtonStyle(
                padding: WidgetStatePropertyAll(EdgeInsets.all(2))),
            child: const Text("Add certification +5%"),
          ),
          TextButton(
              onPressed: () => {},
              style: const ButtonStyle(
                  padding: WidgetStatePropertyAll(EdgeInsets.all(2))),
              child: const Text("Add desired job detail +10%"))
        ],
      ),
    );
  }
}
