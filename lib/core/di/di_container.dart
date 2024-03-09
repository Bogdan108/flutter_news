import 'package:dio/dio.dart';
import 'package:flutter_news/core/platform/network_info.dart';
import 'package:flutter_news/features/news_loader/data/data_sources/favourite_local_source.dart';
import 'package:flutter_news/features/news_loader/data/data_sources/news_local_source.dart';
import 'package:flutter_news/features/news_loader/data/data_sources/news_remote_source.dart';
import 'package:flutter_news/features/news_loader/data/repository/favourite_repository_impl.dart';
import 'package:flutter_news/features/news_loader/data/repository/news_repository_impl.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';
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
  late final SharedPreferences sharedPrefAllNews;
  late final SharedPreferences sharedPrefFavouriteNews;
  late final Dio dio;
  late final InternetConnectionChecker internetChecker;
  late final FavouriteNewsRepository favouriteNewsRepository;
  late final FavouriteNewsLocalDataSource favouriteLocalData;

  Future<void> initDeps() async {
    dio = Dio();
    remoteData = NewsRemoteDataSourceImpl(dio: dio);

    sharedPrefAllNews = await SharedPreferences.getInstance();
    localData = NewsLocalDataSourceImpl(sharedPreferences: sharedPrefAllNews);
    internetChecker = InternetConnectionChecker();
    networkInf = NetworkInfoImpl(connectionCheker: internetChecker);

    sharedPrefFavouriteNews = await SharedPreferences.getInstance();
    favouriteLocalData = FavouriteNewsLocalDataSourceImpl(
        sharedPreferencesFavourite: sharedPrefFavouriteNews);
    favouriteNewsRepository =
        FavouriteNewsRepositoryImp(favouriteLocalSource: favouriteLocalData);

    newsRepository = NewsRepositoryImp(
        networkInform: networkInf,
        localSource: localData,
        remoteSource: remoteData);

    getAllNews = AllNewsCase(
      newsRepository: newsRepository,
      favouriteNewsRepository: favouriteNewsRepository,
    );
  }
}
