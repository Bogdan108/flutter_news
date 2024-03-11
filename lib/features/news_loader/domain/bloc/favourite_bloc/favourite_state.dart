import 'package:equatable/equatable.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';

sealed class FavouriteNewsState extends Equatable {
  const FavouriteNewsState();
  @override
  List<Object> get props => [];
}

class FavouriteNewsStateNewsEmpty extends FavouriteNewsState {}

class FavouriteNewsStateNewsLoading extends FavouriteNewsState {}

class FavouriteNewsStateNewsLoaded extends FavouriteNewsState {
  final List<NewsModel> news;

  const FavouriteNewsStateNewsLoaded({required this.news});
  @override
  List<Object> get props => [news];
}

class FavouriteNewsLoadingError extends FavouriteNewsState {
  final String exception;

  const FavouriteNewsLoadingError({required this.exception});
}
