import 'package:dio/dio.dart';
import 'package:flutter_news/features/data/models/news_model.dart';

abstract interface class NewsRemoteDataSource {
  Future<List<NewsModel>> getAllNews();
}

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  final Dio dio;
  final String _apiKey = "27a81e3616eb4031ad884f0a1b3ed357";
  NewsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<NewsModel>> getAllNews() => _getNewsFromUrl(
      'https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=$_apiKey');

  Future<List<NewsModel>> _getNewsFromUrl(String url) async {
    final response = await dio.get(url);
    if (response.statusCode == 200) {
      final news = response.data as Map<String, dynamic>;
      return (news['articles'] as List)
          .map((n) => NewsModel.fromJson(n))
          .toList();
    } else {
      throw Exception("Error of getting news");
    }
  }
}
