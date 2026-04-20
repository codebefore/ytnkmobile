import 'dart:convert';

import 'package:flutter/material.dart';

class CompanyLogoAvatar extends StatelessWidget {
  final String companyName;
  final String? companyLogo;
  final double radius;
  final double fontSize;

  const CompanyLogoAvatar({
    super.key,
    required this.companyName,
    this.companyLogo,
    this.radius = 24,
    this.fontSize = 16,
  });

  @override
  Widget build(BuildContext context) {
    final imageProvider = _buildImageProvider(companyLogo);
    final hasLogo = imageProvider != null;

    return CircleAvatar(
      radius: radius,
      backgroundColor: hasLogo ? Colors.transparent : Colors.indigo.shade50,
      backgroundImage: imageProvider,
      child: !hasLogo
          ? Text(
              _companyInitials(companyName),
              style: TextStyle(
                color: Colors.indigo,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
    );
  }

  static ImageProvider? _buildImageProvider(String? logo) {
    final normalizedLogo = logo?.trim() ?? "";
    if (normalizedLogo.isEmpty) {
      return null;
    }

    if (normalizedLogo.startsWith("data:image")) {
      final commaIndex = normalizedLogo.indexOf(",");
      if (commaIndex == -1 || commaIndex >= normalizedLogo.length - 1) {
        return null;
      }

      try {
        return MemoryImage(base64Decode(normalizedLogo.substring(commaIndex + 1)));
      } catch (_) {
        return null;
      }
    }

    final uri = Uri.tryParse(normalizedLogo);
    if (uri != null && uri.hasScheme) {
      return NetworkImage(normalizedLogo);
    }

    return null;
  }

  static String _companyInitials(String companyName) {
    final tokens = companyName
        .trim()
        .split(RegExp(r"\s+"))
        .where((token) => token.isNotEmpty)
        .toList();

    if (tokens.isEmpty) {
      return "CO";
    }

    if (tokens.length == 1) {
      return tokens.first.substring(0, 1).toUpperCase();
    }

    return "${tokens[0][0]}${tokens[1][0]}".toUpperCase();
  }
}
