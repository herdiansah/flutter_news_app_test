import 'package:equatable/equatable.dart';

class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object?> get props => [];
}

class LightMode extends ThemeEvent {
  const LightMode();
}

class DarkMode extends ThemeEvent {
  const DarkMode();
}
