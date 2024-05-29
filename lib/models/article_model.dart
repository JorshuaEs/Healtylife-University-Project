import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
/*
import 'package:firebase_database/firebase_database.dart';

class Article {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final String createdAt;

  Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Article.fromSnapshot(DatabaseDataSnapshot snapshot) {
    final dynamic data = snapshot.value;
    if (data is Map<dynamic, dynamic>) {
      return Article(
        id: snapshot.key!,
        title: data['title'],
        subtitle: data['subtitle'],
        body: data['body'],
        author: data['author'],
        authorImageUrl: data['authorImageUrl'],
        category: data['category'],
        imageUrl: data['imageUrl'],
        createdAt: data['createdAt'],
      );
    } else {
      throw ArgumentError('Snapshot value is not a Map');
    }
  }

  static Future<List<Article>> getArticles() async {
    List<Article> articles = [];

    try {
      DatabaseEvent event =
          await FirebaseDatabase.instance.ref().child('Articles').once();

      DataSnapshot snapshot = event.snapshot;
      if (snapshot.exists) {
        print(snapshot.value);
        List<dynamic> data = snapshot.value as List<dynamic>;
        for (var articleData in data) {
          if (articleData != null) {
            final articleSnapshot = DatabaseDataSnapshot(
              key: data.indexOf(articleData).toString(),
              value: articleData,
            );
            articles.add(Article.fromSnapshot(articleSnapshot));
          }
        }
      }
      return articles;
    } catch (e) {
      print('Error: $e');
      return articles;
    }
  }
}

class DatabaseDataSnapshot {
  final String? key;
  final dynamic value;

  DatabaseDataSnapshot({required this.key, required this.value});
}*/

import 'package:firebase_database/firebase_database.dart';

class Article {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final String createdAt;

  Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.authorImageUrl,
    required this.category,
    required this.imageUrl,
    required this.createdAt,
  });

  factory Article.fromMap(Map<dynamic, dynamic> data, String id) {
    return Article(
      id: id,
      title: data['title'] as String? ?? 'No Title',
      subtitle: data['subtitle'] as String? ?? 'No Subtitle',
      body: data['body'] as String? ?? 'No Body',
      author: data['author'] as String? ?? 'No Author',
      authorImageUrl: data['authorImageUrl'] as String? ?? '',
      category: data['category'] as String? ?? 'No Category',
      imageUrl: data['imageUrl'] as String? ?? '',
      createdAt: data['createdAt'] as String? ?? '',
    );
  }

  static Future<List<Article>> getArticles() async {
    List<Article> articles = [];
    print(articles);

    try {
      DatabaseEvent event =
          await FirebaseDatabase.instance.ref().child('Articles').once();

      DataSnapshot snapshot = event.snapshot;

      if (snapshot.exists) {
        final data = snapshot.value as List<dynamic>?;

        if (data != null) {
          for (var item in data) {
            if (item != null && item is Map<dynamic, dynamic>) {
              String id = item['id'] as String? ?? '';
              articles.add(Article.fromMap(item, id));
            }
          }
        }
      }

      return articles;
    } catch (e) {
      print('Error: $e');
      return articles;
    }
  }
}
