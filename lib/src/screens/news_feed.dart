import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_feed/src/models/news_model.dart';
import 'package:news_feed/src/widgets/news_grid_view.dart';
import 'package:news_feed/src/widgets/news_list_view.dart';

class NewsFeedScreen extends StatefulWidget {
  static const String routeName = "/feed";

  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  late Future<List<News>> futureNews;
  bool _isListView = false;

  Future<List<News>> fetchNews() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/'));
    if (response.statusCode == 200) {
      final List<dynamic> jsonPosts = json.decode(response.body);
      return jsonPosts.map((e) => News.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }

  void toggleView(bool val) {
    setState(() {
      _isListView = val;
    });
  }

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mock News"),
        actions: [
          Row(
            children: [
              Text(_isListView ? "List view" : "Grid view"),
              Switch(
                value: _isListView,
                onChanged: toggleView,
                activeColor: Colors.red,
              )
            ],
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder<List<News>>(
                  future: futureNews,
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return _isListView
                          ? NewsListView(snapshot.data!)
                          : NewsGridView(snapshot.data!);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const Text("Loading...");
                  }))
        ],
      ),
    );
  }
}
