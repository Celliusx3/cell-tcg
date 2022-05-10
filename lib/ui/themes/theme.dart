import 'package:flutter/material.dart';

class AppTheme {
  ThemeData get themeData {
    /// Create a TextTheme and ColorScheme, that we can use to generate ThemeData
    final themeData = ThemeData.dark();

    const primary = Color (0xffb41c51);
    const background = Color(0xff000000);
    const bottomSheetBackground = Color(0xff212121);

    final themeColorScheme = themeData.colorScheme.copyWith(
      primary: primary,
      secondary: primary,
      background: background,
    );


    return ThemeData.from(
      colorScheme: themeColorScheme,
    ).copyWith(
      bottomSheetTheme: BottomSheetThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: bottomSheetBackground
      ),
      appBarTheme: AppBarTheme(
        color: themeColorScheme.background,
        elevation: 0,
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: themeColorScheme.secondary,
      ),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: themeColorScheme.secondary,
          )
      ),
    );
  }
}