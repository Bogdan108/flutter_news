import 'package:flutter/material.dart';
import 'package:flutter_news/widgets/news_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News"),
        centerTitle: true,
      ),
      body: const NewsList(),
    );
  }
}
