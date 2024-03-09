import 'package:equatable/equatable.dart';

abstract class NewsLoadEvent extends Equatable {
  const NewsLoadEvent();
  @override
  List<Object> get props => [];
}

class LoadNews extends NewsLoadEvent {}

class LoadFavouriteNews extends NewsLoadEvent {}

class AddFavouriteNews extends NewsLoadEvent {}

class DeleteFavouriteNews extends NewsLoadEvent {}
