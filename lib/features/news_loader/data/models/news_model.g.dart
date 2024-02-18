// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsModel _$NewsModelFromJson(Map<String, dynamic> json) => NewsModel(
      author: json['author'] as String,
      description: json['description'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$NewsModelToJson(NewsModel instance) => <String, dynamic>{
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'content': instance.content,
    };
