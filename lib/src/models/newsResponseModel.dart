// To parse this JSON data, do
//
//     final newsApiResponse = NewsApiResponse.fromRawJson(jsonString);
import 'dart:convert';

import 'package:intl/intl.dart';

class NewsApiResonse {
  final String? status;
  final int? totalResults;
  final List<Article> articles;

  const NewsApiResonse({
    this.status,
    this.totalResults,
    this.articles = const [],
  });

  factory NewsApiResonse.fromRawJson(String str) =>
      NewsApiResonse.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory NewsApiResonse.fromJson(Map<String, dynamic> json) => NewsApiResonse(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List?)
                ?.map((x) => Article.fromJson(x as Map<String, dynamic>))
                .toList() ??
            const [],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'totalResults': totalResults,
        'articles': articles.map((x) => x.toJson()).toList(),
      };
}

class Article {
  final Source? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final DateTime? publishedAt;
  final String? content;

  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  factory Article.fromRawJson(String str) =>
      Article.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json['source'] == null
            ? null
            : Source.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?,
        publishedAt: json['publishedAt'] == null
            ? null
            : DateTime.tryParse(json['publishedAt'] as String),
        content: json['content'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'source': source?.toJson(),
        'author': author,
        'title': title,
        'description': description,
        'url': url,
        'urlToImage': urlToImage,
        'publishedAt': publishedAt?.toIso8601String(),
        'content': content,
      };

  String getTime() {
    final dt = publishedAt;
    if (dt == null) return '';
    final formatter = DateFormat('dd MMMM yyyy H:m');
    return formatter.format(dt);
  }

  String getDateOnly() {
    final dt = publishedAt;
    if (dt == null) return '';
    final formatter = DateFormat('dd MMMM yyyy');
    return formatter.format(dt);
  }
}

class Source {
  final String? id;
  final String? name;

  const Source({
    this.id,
    this.name,
  });

  factory Source.fromRawJson(String str) =>
      Source.fromJson(json.decode(str) as Map<String, dynamic>);

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
