import 'package:flutter/material.dart';

/// Small compatibility shims to keep older Flutter tutorial code compiling on
/// modern Flutter (Material 3).
extension LegacyThemeData on ThemeData {
  Color get backgroundColor => scaffoldBackgroundColor;

  Color get bottomAppBarColor =>
      bottomAppBarTheme.color ?? colorScheme.surface;

  Color get errorColor => colorScheme.error;
}

extension LegacyTextTheme on TextTheme {
  TextStyle? get bodyText1 => bodyLarge;
}

extension LegacyColorScheme on ColorScheme {
  Color get primaryVariant => primaryContainer;

  Color get secondaryVariant => secondaryContainer;
}
