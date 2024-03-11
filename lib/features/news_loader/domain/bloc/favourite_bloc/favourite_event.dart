import 'package:equatable/equatable.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';

sealed class FavouriteNewsEvent extends Equatable {
  const FavouriteNewsEvent();
  @override
  List<Object> get props => [];
}

class LoadFavouriteNews extends FavouriteNewsEvent {}

class AddFavouriteNews extends FavouriteNewsEvent {
  final NewsModel news;

  const AddFavouriteNews({required this.news});
}

class DeleteFavouriteNews extends FavouriteNewsEvent {
  final NewsModel news;

  const DeleteFavouriteNews({required this.news});
}
