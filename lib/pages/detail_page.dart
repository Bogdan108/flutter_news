import 'package:flutter/material.dart';
import 'package:flutter_news/features/domain/entities/news_entity.dart';
import 'package:flutter_news/widgets/news_cache_image.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsEntity news;
  const NewsDetailPage({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Detail News',
        style: theme.textTheme.headlineLarge,
      )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                news.title,
                style: theme.textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              NewsCacheImage(
                news.urlToImage,
              ),
              const SizedBox(height: 20),
              Text(
                'Description',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 1),
              Text(
                news.description,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _textValueDescription(String texts, String value) {
    return [
      const SizedBox(height: 20),
      Text(
        texts,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w300,
        ),
      ),
      const SizedBox(height: 1),
      Text(value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          )),
    ];
  }
}
