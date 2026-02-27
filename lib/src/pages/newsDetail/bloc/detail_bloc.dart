import 'package:flutter_bloc/flutter_bloc.dart';

import 'detail_event.dart';
import 'detail_state.dart';

class DetailBloc extends Bloc<NewsDetailEvent, DetailState> {
  DetailBloc() : super(const LoadingDetail()) {
    on<SelectNewsForDetail>((event, emit) {
      emit(LoadedArticle(selectedArticle: event.article));
    });
  }
}
