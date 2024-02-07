import 'package:flutter_news/core/use_case/use_case.dart';
import 'package:flutter_news/features/domain/entities/news_entity.dart';
import 'package:flutter_news/features/domain/repositories/news_repository.dart';

class AllNewsCase extends UseCase<NewsEntity> {
  final NewsRepository newsRepository;

  AllNewsCase({required this.newsRepository});

  @override
  Future<List<NewsEntity>> call() async {
    return await newsRepository.getAllNews();
  }
}
