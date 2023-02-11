import 'package:flutter/material.dart';
import 'package:news_feed/src/models/news_model.dart';
import 'package:news_feed/src/widgets/news_card.dart';

class NewsListView extends StatelessWidget {
  final List<News> newsList;

  const NewsListView(this.newsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (_, i) => NewsCard(newsList[i]),
      itemCount: newsList.length,
    );
  }
}
