import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
/*
class Article extends Equatable {
  final int id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String authorImageUrl;
  final String category;
  final String imageUrl;
  final DateTime createdAt;

  const Article({
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

  Future<List<Article>> getArticles() async {
    List<Article> articles = [
      Article(
        id: 1,
        title:
            'Proin purus est, lobortis a rhoncus nec, scelerisque quis risus.',
        subtitle:
            'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
        body:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut ex turpis. Duis odio nibh, bibendum ut pharetra non, laoreet nec elit. Vestibulum non neque ante. Sed non magna erat. Pellentesque quis ex porta, pretium tortor eu, eleifend lectus. Curabitur ultricies tristique maximus. Morbi lobortis vehicula dignissim. Proin cursus, tortor in malesuada sagittis, lorem ipsum porta risus, at sodales mi quam ut nisi. Aenean metus libero, venenatis vitae nibh vitae, porttitor iaculis purus. In est libero, tempus tempus purus sit amet, consequat faucibus ligula. Aliquam quis leo lacinia, euismod nibh sit amet, lacinia magna. Mauris laoreet nulla in libero tincidunt mollis.',
        author: 'Author 1',
        authorImageUrl:
            'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947_1280.jpg',
        category: 'Salud',
        imageUrl:
            'https://cdn.pixabay.com/photo/2023/08/02/17/53/peach-8165738_1280.jpg',
        createdAt: DateTime.now().subtract(const Duration(hours: 1)),
      ),
      Article(
        id: 2,
        title: 'Donec accumsan urna varius molestie ultrices.',
        subtitle:
            '2 Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
        body:
            '2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut ex turpis. Duis odio nibh, bibendum ut pharetra non, laoreet nec elit. Vestibulum non neque ante. Sed non magna erat. Pellentesque quis ex porta, pretium tortor eu, eleifend lectus. Curabitur ultricies tristique maximus. Morbi lobortis vehicula dignissim. Proin cursus, tortor in malesuada sagittis, lorem ipsum porta risus, at sodales mi quam ut nisi. Aenean metus libero, venenatis vitae nibh vitae, porttitor iaculis purus. In est libero, tempus tempus purus sit amet, consequat faucibus ligula. Aliquam quis leo lacinia, euismod nibh sit amet, lacinia magna. Mauris laoreet nulla in libero tincidunt mollis.',
        author: 'Author 2',
        authorImageUrl:
            'https://cdn.pixabay.com/photo/2017/06/24/02/56/art-2436545_1280.jpg',
        category: 'Dietas',
        imageUrl:
            'https://cdn.pixabay.com/photo/2018/03/13/18/30/food-3223286_1280.jpg',
        createdAt: DateTime.now().subtract(const Duration(hours: 7)),
      ),
      Article(
        id: 3,
        title: 'Cras id eros varius, commodo eros eget, efficitur purus.',
        subtitle:
            '3 Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
        body:
            '3 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut ex turpis. Duis odio nibh, bibendum ut pharetra non, laoreet nec elit. Vestibulum non neque ante. Sed non magna erat. Pellentesque quis ex porta, pretium tortor eu, eleifend lectus. Curabitur ultricies tristique maximus. Morbi lobortis vehicula dignissim. Proin cursus, tortor in malesuada sagittis, lorem ipsum porta risus, at sodales mi quam ut nisi. Aenean metus libero, venenatis vitae nibh vitae, porttitor iaculis purus. In est libero, tempus tempus purus sit amet, consequat faucibus ligula. Aliquam quis leo lacinia, euismod nibh sit amet, lacinia magna. Mauris laoreet nulla in libero tincidunt mollis.',
        author: 'Author 3',
        authorImageUrl:
            'https://cdn.pixabay.com/photo/2016/11/21/14/53/man-1845814_1280.jpg',
        category: 'Informacion',
        imageUrl:
            'https://cdn.pixabay.com/photo/2017/07/02/19/24/dumbbells-2465478_1280.jpg',
        createdAt: DateTime.now().subtract(const Duration(hours: 6)),
      ),
    ];

    try {
      DataSnapshot snap = (await FirebaseDatabase.instance
          .ref()
          .child('Articles')
          .once()) as DataSnapshot;
      if (snap.exists) {
        print(snap.value);
      }

      return articles;
    } catch (e) {
      print('Error: $e');
      return articles;
    }
  }

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, subtitle, body, author, imageUrl, createdAt];
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';*/

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

  factory Article.fromSnapshot(DataSnapshot snapshot, value) {
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
      DataSnapshot snap = (await FirebaseDatabase.instance
          .ref()
          .child('Articles')
          .once()) as DataSnapshot;

      if (snap.exists) {
        DataSnapshot snap = (await FirebaseDatabase.instance
            .ref()
            .child('Articles')
            .once()) as DataSnapshot;
      } else {
        print('Snapshot value is not a Map');
      }
      return articles;
    } catch (e) {
      print('Error: $e');
      return articles;
    }
/*
    final databaseReference =
        FirebaseDatabase.instance.ref().child('Articles').once();
    final snapshot = await databaseReference;
    final data = snapshot.snapshot.value as Map<dynamic, dynamic>;

    return data.entries
        .map((entry) => Article.fromSnapshot(entry.value))
        .toList();*/
  }
}
