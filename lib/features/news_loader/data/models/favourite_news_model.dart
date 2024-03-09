import 'package:flutter_news/features/news_loader/data/models/news_model.dart';

// ignore: must_be_immutable
class FavouriteNewsModel extends NewsModel {
  bool favourite = false;

  FavouriteNewsModel(
      {required super.author,
      required super.description,
      required super.title,
      required super.url,
      required super.urlToImage,
      required super.content});
}
