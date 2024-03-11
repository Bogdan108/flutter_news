import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/common/widget/custom_error_widget.dart';
import 'package:flutter_news/common/widget/custom_loading_indecator.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_bloc.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_event.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_state.dart';
import 'package:flutter_news/features/news_loader/widget/components/news_list.dart';
import 'package:flutter_news/generated/l10n.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({super.key});

  @override
  State<AllNewsPage> createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {
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
            NewsLoaded() => NewsList(
                state.news,
                isFavourite: true,
              ),
            NewsLoadingError() => CustomErrorWidget(state.exception),
          },
        ),
      ),
    );
  }
}
