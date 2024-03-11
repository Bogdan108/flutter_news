import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/favourite_bloc/favourite_event.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/favourite_bloc/favourite_state.dart';
import 'package:flutter_news/features/news_loader/domain/use_cases/favourite_news.dart';

class FavouriteNewsLoadBloc
    extends Bloc<FavouriteNewsEvent, FavouriteNewsState> {
  final FavouriteNewsCase favouriteNewsCase;

  FavouriteNewsLoadBloc({required this.favouriteNewsCase})
      : super(FavouriteNewsStateNewsEmpty()) {
    on<FavouriteNewsEvent>(
      (event, emit) => switch (event) {
        LoadFavouriteNews() => _load(emit),
        AddFavouriteNews() => _add(event, emit),
        DeleteFavouriteNews() => _delete(event, emit),
      },
    );
  }

  Future<void> _load(Emitter<FavouriteNewsState> emit) async {
    emit(FavouriteNewsStateNewsLoading());
    try {
      final favouriteNewsList = await favouriteNewsCase.getAllFavouriteCase();
      emit(FavouriteNewsStateNewsLoaded(news: favouriteNewsList));
    } catch (e) {
      emit(
        const FavouriteNewsLoadingError(
          exception: 'Error of loading favourite News',
        ),
      );
    }
  }

  Future<void> _add(
    AddFavouriteNews event,
    Emitter<FavouriteNewsState> emit,
  ) async {
    emit(FavouriteNewsStateNewsLoading());
    try {
      favouriteNewsCase.addFavouriteCase(event.news);
    } catch (e) {
      emit(
        const FavouriteNewsLoadingError(
            exception: 'Error of adding favourite News'),
      );
    }
  }

  Future<void> _delete(
    DeleteFavouriteNews event,
    Emitter<FavouriteNewsState> emit,
  ) async {
    emit(FavouriteNewsStateNewsLoading());
    try {
      favouriteNewsCase.deleteFavouriteCase(event.news);
    } catch (e) {
      emit(
        const FavouriteNewsLoadingError(
            exception: 'Error of deleting favourite News'),
      );
    }
  }
}
