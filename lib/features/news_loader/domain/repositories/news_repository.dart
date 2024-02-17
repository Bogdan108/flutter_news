import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';

abstract interface class NewsRepository {
  Future<List<NewsEntity>> getAllNews();
}
