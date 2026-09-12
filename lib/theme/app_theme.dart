import 'package:flutter/material.dart';

class AppColors {
  // Dark Backgrounds
  static const Color bgDark = Color(0xFF090A10);
  static const Color bgSecondary = Color(0xFF0F111C);
  static const Color bgCard = Color(0xFF151828);
  static const Color bgCardHover = Color(0xFF1B2036);
  static const Color glassSurface = Color(0x14FFFFFF);

  // Accents & Gradients
  static const Color accentBlue = Color(0xFF4F8EF7);
  static const Color accentPurple = Color(0xFF8B5CF6);
  static const Color accentCyan = Color(0xFF22D3EE);
  static const Color accentGold = Color(0xFFF59E0B);
  static const Color accentPink = Color(0xFFEC4899);
  static const Color accentGreen = Color(0xFF10B981);

  // Text
  static const Color textPrimary = Color(0xFFF3F4F6);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textMuted = Color(0xFF6B7280);

  // Borders
  static const Color border = Color(0x1AFFFFFF);
  static const Color borderAccent = Color(0x4D4F8EF7);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [accentBlue, accentPurple, accentCyan],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [Color(0x1A4F8EF7), Color(0x1A8B5CF6)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class ResponsiveBreakpoints {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 768 && width < 1024;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;
}
