import 'package:demo_project/common/theme/color_pallete.dart';
import 'package:flutter/material.dart';

class GlobalTheme {
  static final lightColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromRGBO(85, 101, 255, 1),
  ).copyWith(
    brightness: Brightness.light,
    primary: ColorPallete.primaryColor,
    secondary: ColorPallete.secondaryColor,
    tertiary: ColorPallete.tertiaryColor,
  );

  static final darkColorScheme = ColorScheme.fromSeed(
    seedColor: Color.fromRGBO(85, 101, 255, 1),
  ).copyWith(
    brightness: Brightness.dark,
    primary: ColorPallete.primaryColor,
    secondary: ColorPallete.secondaryColor,
    tertiary: ColorPallete.tertiaryColor,
  );

  static final appLightTheme = _globalThemeData.copyWith(
    colorScheme: lightColorScheme,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme().copyWith(
      titleMedium: TextStyle(color: Colors.black),
      labelSmall: TextStyle(color: Colors.black),
    ),
    cardColor: Colors.white,
    appBarTheme: AppBarTheme().copyWith(backgroundColor: Colors.white),
  );
  static final appDarkTheme = _globalThemeData.copyWith(
    colorScheme: darkColorScheme,
    scaffoldBackgroundColor: Color.fromRGBO(11, 12, 21, 1),
    appBarTheme: AppBarTheme().copyWith(
      backgroundColor: Color.fromRGBO(11, 12, 21, 1),
    ),
    cardColor: Color.fromRGBO(11, 12, 21, 1),
    textTheme: TextTheme().copyWith(
      titleMedium: TextStyle(color: Colors.white),
      labelSmall: TextStyle(color: Colors.white),
    ),
  );
  static final _globalThemeData = ThemeData().copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle().copyWith(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        backgroundColor: WidgetStateProperty.all(ColorPallete.primaryColor),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme().copyWith(
      border: _inputBorder(),
      enabledBorder: _inputBorder().copyWith(
        borderSide: BorderSide(color: ColorPallete.inactiveColor),
      ),
      focusedBorder: _inputBorder().copyWith(
        borderSide: BorderSide(color: ColorPallete.primaryColor),
      ),
    ),
  );
  static OutlineInputBorder _inputBorder() =>
      OutlineInputBorder(borderRadius: BorderRadius.circular(12));
}
