import 'package:flutter_news/core/platform/network_info.dart';
import 'package:flutter_news/features/news_loader/data/data_sources/news_local_source.dart';
import 'package:flutter_news/features/news_loader/data/data_sources/news_remote_source.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/news_repository.dart';

class NewsRepositoryImp implements NewsRepository {
  NetworkInfo networkInform;
  NewsRemoteDataSource remoteSource;
  NewsRepositoryImp({required this.networkInform, required this.remoteSource});
  @override
  Future<List<NewsModel>> getAllNews() async {
    try {
      if (await networkInform.isConnected) {
        final freshNews = await remoteSource.getAllNews();
        //localSource.newsToCache(freshNews);
        return freshNews;
      }
    } catch (e) {
      Exception('Error of loading news in NewsRepository');
    }
    return [];
  }
}
