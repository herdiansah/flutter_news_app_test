import 'package:equatable/equatable.dart';

class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object?> get props => [];
}

class SelectedTheme extends ThemeState {
  final ThemeType themeType;

  const SelectedTheme({required this.themeType});

  @override
  List<Object?> get props => [themeType];

  @override
  String toString() => 'Theme Selected($themeType)';
}

enum ThemeType { light, dark }
