import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/favourite_bloc/favourite_event.dart';
import 'package:flutter_news/features/news_loader/widget/components/news_card.dart';

class FavouriteNewsList extends StatelessWidget {
  const FavouriteNewsList({super.key, required this.news, required this.bloc});
  final List<NewsModel> news;
  final Bloc bloc;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(12),
      itemCount: news.length,
      itemBuilder: (context, index) => Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            bloc.add(DeleteFavouriteNews(news: news[index]));
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20.0),
            child: const Icon(Icons.delete),
          ),
          child: NewsCard(news: news[index])),
      separatorBuilder: (context, index) => const SizedBox(height: 16),
    );
  }
}
