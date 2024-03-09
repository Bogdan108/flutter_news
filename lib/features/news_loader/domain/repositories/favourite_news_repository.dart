import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';

abstract interface class FavouriteNewsRepository {
  Future<List<NewsEntity>> getAllFavouriteNews();
  void addFavouriteNews(NewsEntity news);
  void deleteFavouriteNews(NewsEntity news);
}
