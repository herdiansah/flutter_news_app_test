import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/bloc/bloc.dart';
import "package:flutter_news_app/src/theme/legacy_theme.dart";

class BottomNavigationBarWidget extends StatelessWidget {
  final PageController controller;
  const BottomNavigationBarWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        if (state is Opened) {
          return BottomNavigationBar(
            backgroundColor: Theme.of(context).bottomAppBarColor,
            showUnselectedLabels: false,
            showSelectedLabels: false,
            currentIndex: state.pageIndex,
            fixedColor: Theme.of(context).primaryColor,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Theme.of(context).disabledColor,
            onTap: (pageIndex) {
              BlocProvider.of<NavigationBloc>(context)
                  .add(Navigate(pageIndex: pageIndex));

              controller.animateToPage(pageIndex,
                  duration: Duration(milliseconds: 300), curve: Curves.linear);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.play_circle_outline), label: 'Video'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.category), label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
            elevation: 5,
          );
        }
        return SizedBox();
      },
    );
  }
}
