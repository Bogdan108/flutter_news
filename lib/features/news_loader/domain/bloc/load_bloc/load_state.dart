import 'package:equatable/equatable.dart';
import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';

sealed class NewsLoadState extends Equatable {
  const NewsLoadState();
  @override
  List<Object> get props => [];
}

class NewsEmpty extends NewsLoadState {}

class NewsLoading extends NewsLoadState {}

class NewsLoaded extends NewsLoadState {
  final List<NewsEntity> news;

  const NewsLoaded({required this.news});
  @override
  List<Object> get props => [news];
}

class NewsLoadingError extends NewsLoadState {
  final String exception;

  const NewsLoadingError({required this.exception});
}

class FavouriteNewsLoaded extends NewsLoadState {
  final List<NewsEntity> favouriteNews;

  const FavouriteNewsLoaded({required this.favouriteNews});
  @override
  List<Object> get props => [favouriteNews];
}

class DeletedNews extends NewsLoadState {}

class AddedNews extends NewsLoadState {}
