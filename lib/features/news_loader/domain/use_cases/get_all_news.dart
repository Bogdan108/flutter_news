import 'package:flutter_news/core/use_case/use_case.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/news_repository.dart';

class AllNewsCase implements UseCase<NewsModel> {
  final NewsRepository newsRepository;
  final FavouriteNewsRepository favouriteNewsRepository;

  AllNewsCase(
      {required this.newsRepository, required this.favouriteNewsRepository});

  @override
  Future<List<NewsModel>> call() async {
    final allNews = await newsRepository.getAllNews();
    final favouriteNews =
        await favouriteNewsRepository.getAllFavouriteNewsKeys();

    final finalList = allNews.map((e) {
      if (favouriteNews.contains(e.hashCode.toString())) {
        e = e.copyWith(favourite: true);
      }
      return e;
    }).toList();

    return finalList;
  }
}
