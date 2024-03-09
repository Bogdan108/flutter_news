import 'package:flutter_news/features/news_loader/data/models/news_model.dart';

abstract interface class FavouriteNewsRepository {
  Future<List<NewsModel>> getAllFavouriteNews();
  void addFavouriteNews(NewsModel news);
  void deleteFavouriteNews(NewsModel news);
  Future<Set<String>> getAllFavouriteNewsKeys();
}
