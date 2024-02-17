import 'package:flutter/material.dart';
import 'package:flutter_news/features/domain/entities/news_entity.dart';
import 'package:flutter_news/generated/l10n.dart';
import 'package:flutter_news/widgets/news_cache_image.dart';
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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  news.title,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(10),
                child: NewsCacheImage(
                  news.urlToImage,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Text(
                  S.of(context).description,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text(
                  news.description,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                child: Text(
                  S.of(context).content,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Text(
                  news.content,
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    child: const Text(
                      'Open Link',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () {
                      _launchURL(news.url);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
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
