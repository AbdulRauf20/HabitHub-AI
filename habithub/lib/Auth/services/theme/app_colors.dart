import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Brand Colors
  static const Color primary = Color(0xFF22C55E);

  // Backgrounds
  static const Color background = Color(0xFF0F172A);
  static const Color surface = Color(0xFF1E293B);
  static const Color card = Color(0xFF334155);

  // Text Colors
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFCBD5E1);

  // Status Colors
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Contribution Graph
  static const Color contributionInactive = Color(0xFF334155);
  static const Color contributionActive = primary;

  // Buttons
  static const Color buttonPrimaryText = background;
  static const Color buttonSecondaryBackground = Color.fromRGBO(
    255,
    255,
    255,
    0.2,
  );

  // Borders
  static const Color border = Color(0xFF475569);

  // Icons
  static const Color iconPrimary = Colors.white;
  static const Color iconSecondary = Color(0xFF94A3B8);
}