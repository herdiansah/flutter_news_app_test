import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/theme/bloc/theme_event.dart';
import 'package:flutter_news_app/src/theme/bloc/theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(const SelectedTheme(themeType: ThemeType.light)) {
    on<LightMode>((event, emit) {
      emit(const SelectedTheme(themeType: ThemeType.light));
    });

    on<DarkMode>((event, emit) {
      emit(const SelectedTheme(themeType: ThemeType.dark));
    });
  }
}
