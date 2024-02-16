import 'package:flutter/material.dart';
import 'package:flutter_news/features/domain/entities/news_entity.dart';
import 'package:flutter_news/pages/detail_page.dart';
import 'package:flutter_news/widgets/news_cache_image.dart';

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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            // TODO: Понять как растягивать на возможную высоту
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
                  const SizedBox(height: 12),
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
