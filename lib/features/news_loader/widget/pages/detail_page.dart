import 'package:flutter/material.dart';
import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:flutter_news/generated/l10n.dart';
import 'package:flutter_news/common/widget/news_cache_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatelessWidget {
  final NewsEntity news;
  const NewsDetailPage({required this.news, super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(
        S.of(context).detail_news,
        style: theme.textTheme.headlineLarge,
      )),
      body: ListView(
        padding: const EdgeInsets.all(15),
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
            S.of(context).description,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Text(
            news.description,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).content,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Text(
            news.content,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: FilledButton(
              child: Container(
                padding: const EdgeInsets.all(5),
                child: const Text(
                  'Open Link',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
              onPressed: () {
                _launchURL(news.url);
              },
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
