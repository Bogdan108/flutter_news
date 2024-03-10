import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/features/news_loader/domain/use_cases/favourite_news.dart';
import 'package:flutter_news/features/news_loader/domain/use_cases/get_all_news.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_event.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_state.dart';

class NewsLoadBloc extends Bloc<NewsLoadEvent, NewsLoadState> {
  final AllNewsCase allNewsCase;
  final FavouriteNewsCase favouriteNewsCase;
  NewsLoadBloc({required this.favouriteNewsCase, required this.allNewsCase})
      : super(NewsEmpty()) {
    on<LoadNews>((event, emit) async {
      emit(NewsLoading());
      try {
        final newsList = await allNewsCase();
        emit(NewsLoaded(news: newsList));
      } catch (e) {
        emit(const NewsLoadingError(exception: 'Error of loading News'));
      }
    });
  }
}
