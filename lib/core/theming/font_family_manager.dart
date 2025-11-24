import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Manages font families for different locales
/// Easily extensible for adding more languages and font families
class FontFamilyManager {
  /// Get the appropriate font family function based on locale
  /// Returns a GoogleFonts function that can be used to apply the font
  static Function getGoogleFont(String locale) {
    switch (locale) {
      case 'ar': // Arabic
        return GoogleFonts.notoKufiArabicTextTheme;
      case 'en': // English
        return GoogleFonts.notoSansTextTheme;
      default:
        return GoogleFonts.interTextTheme;
    }
  }

  /// Get text direction based on locale
  static TextDirection getTextDirection(String locale) {
    return locale == 'ar' ? TextDirection.rtl : TextDirection.ltr;
  }

  /// Add more languages here as needed
  /// Example for future expansion:
  /// case 'fr': // French
  ///   return GoogleFonts.roboto;
  /// case 'es': // Spanish
  ///   return GoogleFonts.inter;
}
