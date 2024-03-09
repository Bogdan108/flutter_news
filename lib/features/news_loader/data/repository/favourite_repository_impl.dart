import 'package:flutter_news/features/news_loader/data/data_sources/favourite_local_source.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';

class FavouriteNewsRepositoryImp implements FavouriteNewsRepository {
  FavouriteNewsLocalDataSource favouriteLocalSource;
  FavouriteNewsRepositoryImp({
    required this.favouriteLocalSource,
  });

  @override
  Future<List<NewsModel>> getAllFavouriteNews() {
    return favouriteLocalSource.getFavouriteNews();
  }

  @override
  void deleteFavouriteNews(NewsModel news) {
    favouriteLocalSource.deleteFavouriteNews(news);
  }

  @override
  void addFavouriteNews(NewsModel news) {
    favouriteLocalSource.addFavouriteNews(news);
  }

  @override
  Future<Set<String>> getAllFavouriteNewsKeys() {
    return favouriteLocalSource.getFavouriteNewsKeys();
  }
}
