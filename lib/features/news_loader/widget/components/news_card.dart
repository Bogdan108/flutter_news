import 'package:flutter/material.dart';
import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:flutter_news/features/news_loader/widget/pages/detail_page.dart';
import 'package:flutter_news/common/widget/news_cache_image.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final NewsEntity news;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NewsDetailPage(news: news)),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: theme.colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: NewsCacheImage(
                news.urlToImage,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(news.title, style: theme.textTheme.titleMedium),
                  const SizedBox(height: 16),
                  Text(
                    news.author,
                    style: const TextStyle(color: Colors.amber),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
