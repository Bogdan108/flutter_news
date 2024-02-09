import 'package:flutter/material.dart';
import 'package:flutter_news/features/domain/entities/news_entity.dart';
import 'package:flutter_news/pages/detail_page.dart';
import 'package:flutter_news/widgets/news_cache_image.dart';

class NewsCard extends StatelessWidget {
  final NewsEntity news;
  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NewsDetailPage(news: news)));
        },
        child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                NewsCacheImage(
                    imageUrl: news.urlToImage, width: 166, height: 166),
                const SizedBox(
                  width: 16,
                ),
                Flexible(
                    fit: FlexFit.tight,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            news.title,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            news.author,
                            style: const TextStyle(color: Colors.amber),
                          ),
                        ]))
              ],
            )));
  }
}
