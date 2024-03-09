import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'news_model.g.dart';

@JsonSerializable()
class NewsModel extends NewsEntity {
  bool favourite;
  NewsModel(
      {required super.author,
      required super.description,
      required super.title,
      required super.url,
      required super.urlToImage,
      required super.content,
      this.favourite = false});

  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$NewsModelToJson(this);
}
