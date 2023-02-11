import 'dart:math';

class News {
  final int userId;
  final int id;
  final String title;
  final String body;
  final String imageUrl;

  const News(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body,
      required this.imageUrl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
        imageUrl:
            "https://picsum.photos/200/200?image=${Random().nextInt(60)}");
  }
}
