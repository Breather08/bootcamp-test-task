import 'package:flutter/material.dart';
import 'package:news_feed/src/models/news_model.dart';
import 'package:news_feed/src/screens/news_details.dart';

class NewsGrid extends StatelessWidget {
  final News news;

  const NewsGrid(this.news, {super.key});

  void selectNews(BuildContext ctx) {
    Navigator.pushNamed(ctx, NewsDetailsScreen.routeName,
        arguments: NewsDetailsScreenArguments(news));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectNews(context),
      child: Card(
        margin: const EdgeInsets.all(0),
        elevation: 0,
        child: Column(
          children: [
            Image.network(
              news.imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
