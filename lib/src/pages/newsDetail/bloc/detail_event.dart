import 'package:equatable/equatable.dart';
import 'package:flutter_news_app/src/models/newsResponseModel.dart';

abstract class NewsDetailEvent extends Equatable {
  const NewsDetailEvent();

  @override
  List<Object?> get props => [];
}

class SelectNewsForDetail extends NewsDetailEvent {
  final Article article;

  const SelectNewsForDetail({required this.article});

  @override
  List<Object?> get props => [article];

  @override
  String toString() => 'SelectNewsForDetail { title: ${article.title} }';
}
