import 'package:flutter/material.dart';
import 'package:flutter_news/features/domain/entities/news_entity.dart';
import 'package:flutter_news/widgets/news_cache_image.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsEntity news;
  const NewsDetailPage({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: SingleChildScrollView(
        child: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              news.title,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            NewsCacheImage(
              imageUrl: news.urlToImage,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            ..._textValueDescription("Description:", news.description),
          ]),
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