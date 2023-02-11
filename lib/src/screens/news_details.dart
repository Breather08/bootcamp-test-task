import 'package:flutter/material.dart';
import 'package:news_feed/src/models/news_model.dart';

class NewsDetailsScreenArguments {
  final News news;

  NewsDetailsScreenArguments(this.news);
}

class NewsDetailsScreen extends StatelessWidget {
  final News news;
  static const String routeName = "/news-details";

  const NewsDetailsScreen(this.news, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mock News"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            news.imageUrl,
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                news.title,
                style: const TextStyle(fontSize: 26),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                news.body,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              )
            ]),
          )
        ],
      ),
    );
  }
}
