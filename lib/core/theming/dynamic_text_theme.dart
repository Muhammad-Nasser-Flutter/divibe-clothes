import 'package:flutter/material.dart';

import 'font_family_manager.dart';

/// Dynamically generates TextTheme based on locale and brightness
/// This allows the text theme to update when locale or dark mode changes
class DynamicTextTheme {
  /// Generate TextTheme for light mode
  static TextTheme generateLightTheme(String locale) {
    final googleTextTheme = FontFamilyManager.getGoogleFont(locale);

    return googleTextTheme(
      // displayLarge: googleTextTheme.?.copyWith(
      //   fontSize: 28,
      //   fontWeight: FontWeight.w700,
      //   color: AppColors.secondary800Color,
      // ),
      // displayMedium: googleTextTheme.displayMedium?.copyWith(
      //   fontSize: 26,
      //   fontWeight: FontWeight.w700,
      //   color: AppColors.secondary800Color,
      // ),
      // displaySmall: googleTextTheme.displaySmall?.copyWith(
      //   fontSize: 24,
      //   fontWeight: FontWeight.w600,
      //   color: AppColors.secondary800Color,
      // ),
      // headlineLarge: googleTextTheme.headlineLarge?.copyWith(
      //   fontSize: 22,
      //   fontWeight: FontWeight.w600,
      //   color: AppColors.secondary800Color,
      // ),
      // headlineMedium: googleTextTheme.headlineMedium?.copyWith(
      //   fontSize: 20,
      //   fontWeight: FontWeight.w600,
      //   color: AppColors.secondary800Color,
      // ),
      // headlineSmall: googleFont(fontSize: 18, fontWeight: FontWeight.w500, color: AppColors.secondary800Color),
      // // titleLarge: googleFont(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.secondary800Color),
      // // titleMedium: googleFont(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.secondary800Color),
      // // titleSmall: googleFont(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.secondary800Color),
      // bodyLarge: googleFont(fontSize: 16, fontWeight: FontWeight.w500, color: AppColors.secondary800Color),
      // bodyMedium: googleFont(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.secondary800Color),
      // bodySmall: googleFont(fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.secondary800Color),
      // labelLarge: googleFont(fontSize: 10, fontWeight: FontWeight.w400, color: AppColors.secondary800Color),
    );
  }

  /// Generate TextTheme for dark mode
  // static TextTheme generateDarkTheme(String locale) {
  //   final googleFont = FontFamilyManager.getGoogleFont(locale);

  //   return TextTheme(
  //     displayLarge: googleFont(fontSize: 28, fontWeight: FontWeight.w700, color: Colors.white),
  //     displayMedium: googleFont(fontSize: 26, fontWeight: FontWeight.w700, color: Colors.white),
  //     displaySmall: googleFont(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.white),
  //     headlineLarge: googleFont(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white),
  //     headlineMedium: googleFont(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
  //     headlineSmall: googleFont(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
  //     titleLarge: googleFont(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
  //     titleMedium: googleFont(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
  //     titleSmall: googleFont(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
  //     bodyLarge: googleFont(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white),
  //     bodyMedium: googleFont(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),
  //     bodySmall: googleFont(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
  //     labelLarge: googleFont(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),
  //   );
  // }
}
