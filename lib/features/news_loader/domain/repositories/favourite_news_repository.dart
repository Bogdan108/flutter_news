import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';

abstract interface class FavouriteNewsRepository {
  Future<List<NewsEntity>> getAllFavouriteNews();
  void addFavouriteNews(NewsModel news);
  void deleteFavouriteNews(NewsModel news);
  Future<Set<String>> getAllFavouriteNewsKeys();
}
