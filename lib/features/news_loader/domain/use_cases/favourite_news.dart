import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';

class FavouriteNewsCase {
  final FavouriteNewsRepository favouriteNewsRepository;

  FavouriteNewsCase({required this.favouriteNewsRepository});

  Future<List<NewsModel>> getAllFavouriteCase() async {
    return await favouriteNewsRepository.getAllFavouriteNews();
  }

  void addFavouriteCase(NewsModel news) {
    return favouriteNewsRepository.addFavouriteNews(news);
  }

  void deleteFavouriteCase(NewsModel news) {
    return favouriteNewsRepository.deleteFavouriteNews(news);
  }
}
