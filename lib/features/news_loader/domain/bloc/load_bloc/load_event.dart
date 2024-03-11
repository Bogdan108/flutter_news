import 'package:equatable/equatable.dart';

sealed class NewsLoadEvent extends Equatable {
  const NewsLoadEvent();
  @override
  List<Object> get props => [];
}

class LoadNews extends NewsLoadEvent {}
