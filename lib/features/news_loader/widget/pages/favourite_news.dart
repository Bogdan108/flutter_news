import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/common/widget/custom_error_widget.dart';
import 'package:flutter_news/common/widget/custom_loading_indecator.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/favourite_bloc/favourite_bloc.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/favourite_bloc/favourite_event.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/favourite_bloc/favourite_state.dart';
import 'package:flutter_news/generated/l10n.dart';

import '../components/favourite_news_list.dart';

class FavouriteNewsPage extends StatefulWidget {
  const FavouriteNewsPage({super.key});

  @override
  State<FavouriteNewsPage> createState() => _FavouriteNewsPageState();
}

class _FavouriteNewsPageState extends State<FavouriteNewsPage> {
  late final Bloc bloc;
  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<FavouriteNewsLoadBloc>(context);
    bloc.add(LoadFavouriteNews());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        title: Text(
          S.of(context).favourite,
          style: theme.textTheme.headlineLarge,
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          bloc.add(LoadFavouriteNews());
        },
        child: BlocBuilder<FavouriteNewsLoadBloc, FavouriteNewsState>(
          builder: (context, state) => switch (state) {
            FavouriteNewsStateNewsLoading() => const CustomLoadingIndicator(),
            FavouriteNewsStateNewsEmpty() => const CustomLoadingIndicator(),
            FavouriteNewsStateNewsLoaded() => FavouriteNewsList(
                news: state.news,
                bloc: bloc,
              ),
            FavouriteNewsLoadingError() => CustomErrorWidget(state.exception),
          },
        ),
      ),
    );
  }
}
