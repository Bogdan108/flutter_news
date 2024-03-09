import 'package:flutter_news/features/news_loader/data/models/news_model.dart';

abstract interface class NewsRepository {
  Future<List<NewsModel>> getAllNews();
}
