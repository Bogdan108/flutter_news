import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/core/di/di_container.dart';
import 'package:flutter_news/features/presentation/bloc/load_bloc/load_bloc.dart';
import 'package:flutter_news/pages/home_page.dart';

void main() async {
  await DIContainer.instance.initDeps();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            NewsLoadBloc(allNewsCase: DIContainer.instance.getAllNews),
        child: const HomePage(),
      ),
    );
  }
}
