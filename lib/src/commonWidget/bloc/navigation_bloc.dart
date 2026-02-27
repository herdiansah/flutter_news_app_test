import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/src/commonWidget/bloc/navigation_event.dart';
import 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(const Opened(pageIndex: 0)) {
    on<Navigate>((event, emit) {
      emit(Opened(pageIndex: event.pageIndex));
    });
  }
}
