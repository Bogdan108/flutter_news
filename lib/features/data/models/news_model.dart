import 'package:flutter_news/features/domain/entities/news_entity.dart';

class NewsModel extends NewsEntity {
  const NewsModel(
      {required super.author,
      required super.description,
      required super.title,
      required super.url,
      required super.urlToImage});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      author: json['author'],
      description: json['description'],
      title: json['title'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "author": author,
      "description": description,
      "title": title,
      "url": url,
      "urlToImage": urlToImage,
    };
  }
}
