import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/features/news_loader/domain/use_cases/get_all_news.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_event.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_state.dart';

class NewsLoadBloc extends Bloc<NewsLoadEvent, NewsLoadState> {
  final AllNewsCase allNewsCase;

  NewsLoadBloc({required this.allNewsCase}) : super(NewsEmpty()) {
    on<NewsLoadEvent>((event, emit) => switch (event) {
          LoadNews() => _load(emit),
        });
  }

  Future<void> _load(Emitter<NewsLoadState> emit) async {
    emit(NewsLoading());
    try {
      final newsList = await allNewsCase();
      emit(NewsLoaded(news: newsList));
    } catch (e) {
      emit(const NewsLoadingError(exception: 'Error of loading News'));
    }
  }
}
