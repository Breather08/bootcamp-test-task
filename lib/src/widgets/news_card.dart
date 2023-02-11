import 'package:flutter/material.dart';
import 'package:news_feed/src/models/news_model.dart';
import 'package:news_feed/src/screens/news_details.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard(this.news, {super.key});

  void selectNews(BuildContext ctx) {
    Navigator.pushNamed(ctx, NewsDetailsScreen.routeName,
        arguments: NewsDetailsScreenArguments(news));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectNews(context),
      child: Card(
        elevation: 4,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              child: Image.network(
                news.imageUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    news.title,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
