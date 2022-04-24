import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'k_colors.dart';

class AppTheme {
  static final theme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: lightWhiteColor,
    colorScheme: const ColorScheme.light(secondary: lightWhiteColor),
    appBarTheme: const AppBarTheme(
      backgroundColor: whiteColor,
      titleTextStyle: TextStyle(color: textColor),
      elevation: 0,
      actionsIconTheme: IconThemeData(color: textColor, size: 18.0),
    ),
    textTheme: GoogleFonts.poppinsTextTheme(
        // const TextTheme(
        //   caption: TextStyle(fontSize: 12, height: 1.83),
        //   bodyText1:
        //       TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.375),
        //   bodyText2: TextStyle(fontSize: 14, height: 1.5714),
        //   button: TextStyle(fontSize: 16, height: 2, fontWeight: FontWeight.w600),
        //   // titleLarge: const TextStyle(
        //   //     fontSize: 16, height: 2, fontWeight: FontWeight.w600),
        // ),
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: lightBlueColor,
        maximumSize: const Size(double.infinity, 50),
        minimumSize: const Size(double.infinity, 50),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: TextStyle(color: textColor.withOpacity(0.3)),
      suffixIconColor: textColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      fillColor: searchFillColor,
      filled: true,
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: lightBlueColor,
    ),
  );
}
