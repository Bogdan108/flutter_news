import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_news/core/di/di_container.dart';
import 'package:flutter_news/core/theme/custom_theme.dart';
import 'package:flutter_news/features/news_loader/domain/bloc/load_bloc/load_bloc.dart';
import 'package:flutter_news/generated/l10n.dart';
import 'package:flutter_news/features/news_loader/widget/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DIContainer.instance.initDeps();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: BlocProvider(
        lazy: false,
        create: (context) =>
            NewsLoadBloc(allNewsCase: DIContainer.instance.getAllNews),
        child: const HomePage(),
      ),
    );
  }
}
