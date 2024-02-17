import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/common/widget/custom_error_widget.dart';
import 'package:flutter_news/common/widget/custom_loading_indecator.dart';
import 'package:flutter_news/features/news_loader/domain/entities/news_entity.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_bloc.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_event.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_state.dart';
import 'package:flutter_news/generated/l10n.dart';
import 'package:flutter_news/features/news_loader/widget/components/news_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final Bloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<NewsLoadBloc>(context);
    bloc.add(LoadNews());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          S.of(context).news,
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          bloc.add(LoadNews());
        },
        child: BlocBuilder<NewsLoadBloc, NewsLoadState>(
          builder: (context, state) => switch (state) {
            NewsLoading() => const CustomLoadingIndicator(),
            NewsEmpty() => const CustomLoadingIndicator(),
            NewsLoaded() => _NewsList(state.news),
            NewsLoadingError() => CustomErrorWidget(state.exception),
          },
        ),
      ),
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList(this.news);

  final List<NewsEntity> news;

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: news.length,
        itemBuilder: (context, index) => NewsCard(news: news[index]),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
      );
}
