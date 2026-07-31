import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextStyle get _inter => GoogleFonts.inter();

  static TextStyle get displayLarge => _inter.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        letterSpacing: -0.02,
        height: 56 / 48,
      );

  static TextStyle get displayMedium => _inter.copyWith(
        fontSize: 45,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get displaySmall => _inter.copyWith(
        fontSize: 36,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get headlineLarge => _inter.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 40 / 32,
      );

  static TextStyle get headlineMedium => _inter.copyWith(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 36 / 28, // this maps to headline-lg-mobile in the design
      );

  static TextStyle get headlineSmall => _inter.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get titleLarge => _inter.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        height: 28 / 22,
      );

  static TextStyle get titleMedium => _inter.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
      );

  static TextStyle get titleSmall => _inter.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      );

  static TextStyle get bodyLarge => _inter.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 26 / 18,
      );

  static TextStyle get bodyMedium => _inter.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
      );

  static TextStyle get bodySmall => _inter.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
      );

  static TextStyle get labelLarge => _inter.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
      );

  static TextStyle get labelMedium => _inter.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.1,
        height: 20 / 14,
      );

  static TextStyle get labelSmall => _inter.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
      );
}
