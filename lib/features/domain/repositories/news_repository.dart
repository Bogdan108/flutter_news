import 'package:flutter_news/features/domain/entities/news_entity.dart';

abstract class NewsRepository {
  Future<List<NewsEntity>> getAllNews();
}
