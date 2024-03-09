import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';

class AddFavouriteCase {
  final FavouriteNewsRepository favouriteNewsRepository;

  AddFavouriteCase({required this.favouriteNewsRepository});

  Future<List<NewsEntity>> getAllFavouriteCase() async {
    return await favouriteNewsRepository.getAllFavouriteNews();
  }

  void addFavouriteCase(NewsModel news) {
    return favouriteNewsRepository.addFavouriteNews(news);
  }

  void deleteFavouriteCase(NewsModel news) {
    return favouriteNewsRepository.deleteFavouriteNews(news);
  }
}
