import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends NewsEntity {
  final bool favourite;
  const NewsModel(
      {required super.author,
      required super.description,
      required super.title,
      required super.url,
      required super.urlToImage,
      required super.content,
      this.favourite = false});
  NewsModel copyWith({
    required bool favourite,
  }) {
    return NewsModel(
      author: author,
      description: description,
      title: title,
      url: url,
      urlToImage: urlToImage,
      content: content,
      favourite: favourite,
    );
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
