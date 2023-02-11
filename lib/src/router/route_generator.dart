import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_feed/src/screens/news_details.dart';
import 'package:news_feed/src/screens/news_feed.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NewsFeedScreen.routeName:
        return CupertinoPageRoute(builder: (_) => const NewsFeedScreen());
      case NewsDetailsScreen.routeName:
        final args = settings.arguments as NewsDetailsScreenArguments;
        return CupertinoPageRoute(builder: (_) => NewsDetailsScreen(args.news));
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(title: const Text("Meals App")),
              body: const Center(
                child: Text("Error"),
              ),
            ));
  }
}
