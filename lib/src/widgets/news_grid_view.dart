import 'package:flutter/material.dart';
import 'package:news_feed/src/models/news_model.dart';
import 'package:news_feed/src/widgets/news_grid.dart';

class NewsGridView extends StatelessWidget {
  final List<News> newsList;

  const NewsGridView(this.newsList, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 0,
            mainAxisSpacing: 0,
            childAspectRatio: 1,
            crossAxisCount: 3),
        itemCount: newsList.length,
        itemBuilder: (BuildContext ctx, i) {
          return NewsGrid(newsList[i]);
        });
  }
}
