import 'package:cloth_ecommerce/core/theming/dynamic_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloth_ecommerce/core/theming/styles.dart';

import 'colors.dart';

ThemeData lightTheme(String locale) => ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 0,
    scrolledUnderElevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Transparent/status bar is hidden.
      statusBarIconBrightness: Brightness.light, // For iOS: status bar text color
    ),
    backgroundColor: AppColors.scaffoldBackground,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    actionsIconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  timePickerTheme: TimePickerThemeData(
    backgroundColor: Colors.white,
    helpTextStyle: style14.copyWith(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 18,
    ),
    cancelButtonStyle: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        style14.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    ),
    confirmButtonStyle: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        style14.copyWith(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    ),
    dayPeriodTextStyle: style14.copyWith(
      color: AppColors.primaryColor,
      fontWeight: FontWeight.w500,
      fontSize: 16,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.grey,
  ),

  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  primaryColor: AppColors.primaryColor,
  textTheme: DynamicTextTheme.generateLightTheme(locale),
);

// final ThemeData darkTheme = ThemeData(
//   appBarTheme: const AppBarTheme(
//     centerTitle: true,
//     systemOverlayStyle: SystemUiOverlayStyle.light,
//     elevation: 0,
//     scrolledUnderElevation: 0,
//     color: Color(0xff222225),
//     iconTheme: IconThemeData(
//       color: Colors.white,
//     ),
//     actionsIconTheme: IconThemeData(
//       color: Colors.white,
//     ),
//   ),
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     backgroundColor: Colors.transparent,
//     selectedItemColor: Colors.white,
//     unselectedItemColor: Colors.grey[600],
//   ),
//   scaffoldBackgroundColor: AppColors.scaffoldBackground,
//   primaryColor: Colors.white,
// );
