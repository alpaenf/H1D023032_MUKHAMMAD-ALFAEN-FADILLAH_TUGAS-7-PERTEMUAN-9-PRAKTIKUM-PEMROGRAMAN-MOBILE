import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Sage Green Color Palette
  static const Color sageGreen = Color(0xFF64B5F6);
  static const Color sageGreenDark = Color(0xFF42A5F5);
  static const Color sageGreenLight = Color(0xFFBBDEFB);
  static const Color pureWhite = Color(0xFFFFFFFF);
  static const Color textDark = Color(0xFF1E3A5F);
  static const Color textLight = Color(0xFF5A7A99);
  static const Color accentGreen = Color(0xFF64B5F6);

  // Theme Data
  static ThemeData get theme {
    return ThemeData(
      primaryColor: sageGreenDark,
      scaffoldBackgroundColor: pureWhite,
      colorScheme: ColorScheme.light(
        primary: sageGreenDark,
        secondary: sageGreen,
        surface: pureWhite,
        background: pureWhite,
        onPrimary: textDark,
        onSecondary: textDark,
        onSurface: textDark,
        onBackground: textDark,
      ),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: textDark,
        displayColor: textDark,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: pureWhite,
        elevation: 0,
        iconTheme: const IconThemeData(color: textDark),
        titleTextStyle: GoogleFonts.poppins(
          color: textDark,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: sageGreenDark,
          foregroundColor: pureWhite,
          textStyle: GoogleFonts.poppins(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: sageGreenLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: sageGreen, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: sageGreenDark, width: 2),
        ),
        labelStyle: GoogleFonts.poppins(color: textLight),
        hintStyle: GoogleFonts.poppins(color: textLight),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: pureWhite,
        surfaceTintColor: pureWhite,
      ),
      cardTheme: CardThemeData(
        color: pureWhite,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  // Text Styles
  static TextStyle get heading1 => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: textDark,
      );

  static TextStyle get heading2 => GoogleFonts.poppins(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: textDark,
      );

  static TextStyle get heading3 => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: textDark,
      );

  static TextStyle get bodyText => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textDark,
      );

  static TextStyle get bodyTextLight => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: textLight,
      );

  static TextStyle get subtitle => GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: textLight,
      );

  static TextStyle get buttonText => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: pureWhite,
      );
}
