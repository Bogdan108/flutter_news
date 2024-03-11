import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/di/di_container.dart';
import 'package:flutter_news/features/news_loader/data/models/news_model.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/favourite_bloc/favourite_event.dart';
import 'package:flutter_news/features/news_loader/domain/repositories/favourite_news_repository.dart';
import 'package:flutter_news/generated/l10n.dart';
import 'package:flutter_news/common/widget/news_cache_image.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailPage extends StatefulWidget {
  final NewsModel news;
  const NewsDetailPage({required this.news, super.key});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  late final Bloc bloc;
  late FavouriteNewsRepository favouriteNewsRepository;

  @override
  void initState() {
    bloc = BlocProvider.of<FavouriteNewsLoadBloc>(context);
    favouriteNewsRepository = DIContainer.instance.favouriteNewsRepository;
    super.initState();
  }

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
          Row(
            children: [
              Expanded(
                child: Text(
                  widget.news.title,
                  style: theme.textTheme.titleLarge,
                ),
              ),
              //TODO fav button
              if (true)
                FilledButton(
                  child: Container(
                    child: Icon(
                      Icons.favorite,
                      color: widget.news.favourite ? Colors.red : Colors.grey,
                    ),
                  ),
                  onPressed: () {
                    if (!widget.news.favourite) {
                      setState(() {
                        bloc.add(AddFavouriteNews(news: widget.news));
                      });
                    } else {
                      bloc.add(DeleteFavouriteNews(news: widget.news));
                    }
                    setState(() {
                      widget.news.favourite = !widget.news.favourite;
                    });
                  },
                ),
            ],
          ),
          const SizedBox(height: 20),
          NewsCacheImage(
            widget.news.urlToImage,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).description,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            widget.news.description,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 20),
          Text(
            S.of(context).content,
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 10),
          Text(
            widget.news.content,
            style: theme.textTheme.bodyMedium,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: FilledButton(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Open Link',
                  style: theme.textTheme.bodySmall,
                ),
              ),
              onPressed: () {
                _launchURL(widget.news.url);
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
