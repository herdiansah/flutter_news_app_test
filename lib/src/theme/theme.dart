import 'package:flutter/material.dart';

import 'package:flutter_news_app/src/theme/color/dark_color.dart';
import 'color/lightColor.dart';

class AppTheme {
  const AppTheme();

  static final ColorScheme _lightScheme = ColorScheme(
    brightness: Brightness.light,
    primary: LightColor.purple,
    onPrimary: Colors.white,
    secondary: LightColor.lightBlue,
    onSecondary: Colors.white,
    surface: LightColor.background,
    onSurface: LightColor.titleTextColor,
    error: Colors.red,
    onError: Colors.white,
  );

  static final ColorScheme _darkScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: DarkColor.purple,
    onPrimary: DarkColor.white,
    secondary: DarkColor.lightBlue,
    onSecondary: DarkColor.white,
    surface: DarkColor.background,
    onSurface: DarkColor.titleTextColor,
    error: Colors.red,
    onError: DarkColor.white,
  );

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _lightScheme,
    scaffoldBackgroundColor: LightColor.background,
    cardTheme: const CardTheme(),
    iconTheme: const IconThemeData(),
    dividerColor: LightColor.lightGrey,
    disabledColor: LightColor.darkgrey,
    bottomAppBarTheme: const BottomAppBarTheme(),
  ).copyWith(
    cardTheme: CardTheme(color: LightColor.background),
    iconTheme: IconThemeData(color: LightColor.lightblack),
    bottomAppBarTheme: BottomAppBarTheme(color: LightColor.background),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: _darkScheme,
    scaffoldBackgroundColor: DarkColor.background,
  ).copyWith(
    cardTheme: CardTheme(color: DarkColor.background),
    iconTheme: IconThemeData(color: DarkColor.lightblack),
    bottomAppBarTheme: BottomAppBarTheme(color: DarkColor.lightblack),
  );

  static TextStyle titleStyle =
      const TextStyle(color: LightColor.titleTextColor, fontSize: 16);
  static TextStyle subTitleStyle =
      const TextStyle(color: LightColor.subTitleTextColor, fontSize: 12);

  static TextStyle h1Style =
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
  static TextStyle h2Style = const TextStyle(fontSize: 22);
  static TextStyle h3Style = const TextStyle(fontSize: 20);
  static TextStyle h4Style = const TextStyle(fontSize: 18);
  static TextStyle h5Style = const TextStyle(fontSize: 16);
  static TextStyle h6Style = const TextStyle(fontSize: 14);
}
