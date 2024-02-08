import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/features/domain/entities/news_entity.dart';
import 'package:flutter_news/features/presentation/bloc/load_bloc/load_bloc.dart';
import 'package:flutter_news/features/presentation/bloc/load_bloc/load_event.dart';
import 'package:flutter_news/features/presentation/bloc/load_bloc/load_state.dart';
import 'package:flutter_news/widgets/news_card.dart';

class NewsList extends StatefulWidget {
  const NewsList({super.key});

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<NewsLoadBloc>(context).add(LoadNews());

    return BlocBuilder<NewsLoadBloc, NewsLoadState>(builder: (context, state) {
      List<NewsEntity> news = [];

      if (state is NewsLoading) {
        return _loadingIndicator();
      }

      if (state is NewsLoadingError) {
        return Text(
          state.exception,
          style: const TextStyle(color: Colors.white, fontSize: 25),
        );
      }
      if (state is NewsLoaded) {
        news = state.news;

        return ListView.separated(
          itemBuilder: (context, index) {
            return NewsCard(news: news[index]);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[400],
            );
          },
          itemCount: news.length,
        );
      }
      return _loadingIndicator();
    });
  }

  Widget _loadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
