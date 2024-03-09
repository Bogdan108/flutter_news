import 'package:flutter_news/core/use_case/use_case.dart';
import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/news_repository.dart';

class AllNewsCase implements UseCase<NewsEntity> {
  final NewsRepository newsRepository;
  final FavouriteNewsRepository favouriteNewsRepository;

  AllNewsCase(
      {required this.newsRepository, required this.favouriteNewsRepository});

  @override
  Future<List<NewsEntity>> call() async {
    final allNews = await newsRepository.getAllNews();
    final favouriteNews =
        await favouriteNewsRepository.getAllFavouriteNewsKeys();
    final finalList = allNews
        .where((e) => favouriteNews.contains(e.hashCode.toString()))
        .toList();
    return finalList;
  }
}
