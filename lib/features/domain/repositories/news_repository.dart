import 'package:flutter_news/features/domain/entities/news_entity.dart';

abstract interface class NewsRepository {
  Future<List<NewsEntity>> getAllNews();
}
