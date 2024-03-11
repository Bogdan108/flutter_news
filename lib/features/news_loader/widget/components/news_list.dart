import 'package:flutter/material.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/widget/components/news_card.dart';

class NewsList extends StatelessWidget {
  const NewsList(this.news, {this.isFavourite = false, super.key});
  final bool isFavourite;
  final List<NewsModel> news;

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.all(12),
        itemCount: news.length,
        itemBuilder: (context, index) => NewsCard(
          news: news[index],
          isFavourite: isFavourite,
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      );
}
