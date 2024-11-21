import 'package:flutter/material.dart';
import 'package:homei/core/utils/color_palette.dart';
import 'package:google_fonts/google_fonts.dart';

class AppThemes {
  // Light Theme
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    colorScheme: const ColorScheme.light(primary: AppColors.primary),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: GoogleFonts.robotoTextTheme(
      const TextTheme(
        displayLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
        bodyLarge: TextStyle(fontSize: 16.0, color: Colors.black87),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.lightText,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        fixedSize: const Size(double.maxFinite, 45),
      ),
    ),
  );

  // // Dark Theme
  // static final darkTheme = ThemeData(
  //   primaryColor: Colors.deepOrange,
  //   scaffoldBackgroundColor: Colors.black,
  //   appBarTheme: const AppBarTheme(
  //     backgroundColor: Colors.deepOrange,
  //     foregroundColor: Colors.white,
  //     elevation: 0,
  //   ),
  //   textTheme: const TextTheme(
  //     headline1: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
  //     bodyText1: TextStyle(fontSize: 16.0, color: Colors.white70),
  //   ),
  //   inputDecorationTheme: InputDecorationTheme(
  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
  //     filled: true,
  //     fillColor: Colors.grey[800],
  //   ),
  //   elevatedButtonTheme: ElevatedButtonThemeData(
  //     style: ElevatedButton.styleFrom(
  //       backgroundColor: Colors.deepOrange,
  //       foregroundColor: Colors.white,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(8.0),
  //       ),
  //     ),
  //   ),
  // );
}
