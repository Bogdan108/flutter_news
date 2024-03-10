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
    try {
      return sharedPreferencesFavourite.setString(
          news.hashCode.toString(), json.encode(news.toJson()));
    } catch (e) {
      print(e);
    }
    print(json.encode(news.toJson()));
    return Future.value(true);
  }

  @override
  Future<bool> deleteFavouriteNews(NewsModel news) {
    try {
      return sharedPreferencesFavourite.remove(news.hashCode.toString());
    } catch (e) {
      print(e);
    }
    print(json.encode(news.toJson()));
    return Future.value(true);
  }

  @override
  Future<List<NewsModel>> getFavouriteNews() {
    final List<String> keysOfFavourite =
        sharedPreferencesFavourite.getKeys().toList();

    List<NewsModel> values = [];
    try {
      for (var key in keysOfFavourite) {
        values.add(NewsModel.fromJson(
            json.decode(sharedPreferencesFavourite.getString(key)!)));
      }
    } catch (e) {
      print(e);
    }

    return Future.value(values);
  }

  @override
  Future<Set<String>> getFavouriteNewsKeys() {
    return Future.value(sharedPreferencesFavourite.getKeys());
  }
}
