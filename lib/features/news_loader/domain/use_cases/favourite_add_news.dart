import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';

class AddFavouriteCase {
  final FavouriteNewsRepository favouriteNewsRepository;

  AddFavouriteCase({required this.favouriteNewsRepository});

  // void addFavouriteCase(List<NewsEntity> news) async {
  //   return favouriteNewsRepository.addFavouriteNews(news);
  // }

  Future<List<NewsEntity>> getAllFavouriteCase() async {
    return await favouriteNewsRepository.getAllFavouriteNews();
  }
}
