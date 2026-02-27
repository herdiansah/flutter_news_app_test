import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/bloc/simple_bloc_delegate.dart';
import 'package:flutter_news_app/src/commonWidget/bloc/bloc.dart';
import 'package:flutter_news_app/src/theme/bloc/theme_bloc.dart';
import 'package:flutter_news_app/src/theme/bloc/theme_state.dart';
import 'package:flutter_news_app/src/theme/theme.dart';
import 'src/helpers/routes.dart';
import 'src/pages/homePage/bloc/bloc.dart';
import 'src/pages/newsDetail/bloc/bloc.dart';
import 'src/resources/repository.dart';

void main() {
  // bloc 8.x uses a global observer
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) =>
              NewsBloc(repository: Repository())..add(Fetch(type: 'General')),
        ),
        BlocProvider<DetailBloc>(create: (context) => DetailBloc()),
        BlocProvider<NavigationBloc>(create: (context) => NavigationBloc()),
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          // default theme (avoid uninitialized ThemeData)
          ThemeData appTheme = AppTheme.lightTheme;

          if (state is SelectedTheme) {
            appTheme = state.themeType == ThemeType.light
                ? AppTheme.lightTheme
                : AppTheme.darkTheme;
          }

          return MaterialApp(
            title: 'Flutter News App',
            theme: appTheme,
            debugShowCheckedModeBanner: false,
            routes: Routes.getRoute(),
          );
        },
      ),
    );
  }
}
