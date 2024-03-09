import 'package:flutter_news/features/news_loader/data/data_sources/favourite_local_source.dart';
import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';

class FavouriteNewsRepositoryImp implements FavouriteNewsRepository {
  FavouriteNewsLocalDataSource favouriteLocalSource;
  FavouriteNewsRepositoryImp({
    required this.favouriteLocalSource,
  });

  @override
  void addFavouriteNews(NewsEntity news) {
    // TODO: implement addFavouriteNews
  }

  @override
  Future<List<NewsEntity>> getAllFavouriteNews() {
    // TODO: implement getAllFavouriteNews
    throw UnimplementedError();
  }

  @override
  void deleteFavouriteNews(NewsEntity news) {
    // TODO: implement deleteFavouriteNews
  }
}
