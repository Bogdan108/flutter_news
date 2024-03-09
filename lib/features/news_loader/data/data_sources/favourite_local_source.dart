import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class FavouriteNewsLocalDataSource {
  Future<List<NewsModel>> getFavouriteNews();
  Future<Set<String>> getFavouriteNewsKeys();
  Future<bool> addFavouriteNews(List<NewsModel> news);
  Future<bool> deleteFavouriteNews(List<NewsModel> news);
}

class FavouriteNewsLocalDataSourceImpl implements FavouriteNewsLocalDataSource {
  final SharedPreferences sharedPreferencesFavourite;

  FavouriteNewsLocalDataSourceImpl({required this.sharedPreferencesFavourite});

  @override
  Future<bool> addFavouriteNews(List<NewsModel> news) {
    // TODO: implement addFavouriteNews
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteFavouriteNews(List<NewsModel> news) {
    // TODO: implement deleteFavouriteNews
    throw UnimplementedError();
  }

  @override
  Future<List<NewsModel>> getFavouriteNews() {
    // TODO: implement getFavouriteNews
    throw UnimplementedError();
  }

  @override
  Future<Set<String>> getFavouriteNewsKeys() {
    // TODO: implement getFavouriteNewsKeys
    throw UnimplementedError();
  }
}
