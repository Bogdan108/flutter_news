import 'package:dio/dio.dart';
import 'package:flutter_news/core/platform/network_info.dart';
import 'package:flutter_news/features/news_loader/data/data_sources/news_local_source.dart';
import 'package:flutter_news/features/news_loader/data/data_sources/news_remote_source.dart';
import 'package:flutter_news/features/news_loader/data/repository/news_repository.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/news_repository.dart';
import 'package:flutter_news/features/news_loader/domain/use_cases/get_all_news.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final class DIContainer {
  DIContainer._();
  static DIContainer get instance => _instance ??= DIContainer._();
  static DIContainer? _instance;

  late final NewsRepository newsRepository;
  late final AllNewsCase getAllNews;
  late final NewsRemoteDataSource remoteData;
  late final NewsLocalDataSource localData;
  late final NetworkInfo networkInf;
  late final SharedPreferences sharedPref;
  late final Dio dio;
  late final InternetConnectionChecker internetChecker;

  Future<void> initDeps() async {
    dio = Dio();
    remoteData = NewsRemoteDataSourceImpl(dio: dio);

    sharedPref = await SharedPreferences.getInstance();
    localData = NewsLocalDataSourceImpl(sharedPreferences: sharedPref);

    internetChecker = InternetConnectionChecker();
    networkInf = NetworkInfoImpl(connectionCheker: internetChecker);

    newsRepository = NewsRepositoryImp(
        networkInform: networkInf,
        localSource: localData,
        remoteSource: remoteData);
    getAllNews = AllNewsCase(newsRepository: newsRepository);
  }
}
