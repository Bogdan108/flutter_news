import 'dart:convert';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class FavouriteNewsLocalDataSource {
  Future<List<NewsModel>> getFavouriteNews();
  Future<Set<String>> getFavouriteNewsKeys();
  Future<bool> addFavouriteNews(NewsModel news);
  Future<bool> deleteFavouriteNews(NewsModel news);
}

class FavouriteNewsLocalDataSourceImpl implements FavouriteNewsLocalDataSource {
  final SharedPreferences sharedPreferencesFavourite;

  FavouriteNewsLocalDataSourceImpl({required this.sharedPreferencesFavourite});

  @override
  Future<bool> addFavouriteNews(NewsModel news) {
    return sharedPreferencesFavourite.setString(
        news.hashCode.toString(), json.encode(news.toJson()));
  }

  @override
  Future<bool> deleteFavouriteNews(NewsModel news) {
    return sharedPreferencesFavourite.remove(news.hashCode.toString());
  }

  @override
  Future<List<NewsModel>> getFavouriteNews() {
    final allFavouriteNews = sharedPreferencesFavourite
        .getKeys()
        .map((e) => NewsModel.fromJson(
            json.decode(sharedPreferencesFavourite.getString(e)!)))
        .toList();

    return Future.value(allFavouriteNews);
  }

  @override
  Future<Set<String>> getFavouriteNewsKeys() {
    return Future.value(sharedPreferencesFavourite.getKeys());
  }
}
