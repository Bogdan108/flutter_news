import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_news/features/data/models/news_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NewsLocalDataSource {
  Future<List<NewsModel>> getLastNewsFromCache();
  Future<List<String>> newsToCache(List<NewsModel> news);
}

// ignore: constant_identifier_names
const CACHED_PERSONS_LIST = 'CACHED_NEWS_LIST';

class NewsLocalDataSourceImpl implements NewsLocalDataSource {
  final SharedPreferences sharedPreferences;

  NewsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<NewsModel>> getLastNewsFromCache() {
    final jsonNewsList = sharedPreferences.getStringList(CACHED_PERSONS_LIST);
    if (jsonNewsList!.isNotEmpty) {
      debugPrint('Get Persons from Cache: ${jsonNewsList.length}');
      return Future.value(jsonNewsList
          .map((person) => NewsModel.fromJson(json.decode(person)))
          .toList());
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<String>> newsToCache(List<NewsModel> news) {
    final List<String> jsonNewsList =
        news.map((n) => json.encode(n.toJson())).toList();

    sharedPreferences.setStringList(CACHED_PERSONS_LIST, jsonNewsList);
    debugPrint('Persons to write Cache: ${jsonNewsList.length}');
    return Future.value(jsonNewsList);
  }
}
