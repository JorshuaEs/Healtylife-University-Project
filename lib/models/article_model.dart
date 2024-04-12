import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String author;
  final String imageUrl;
  final DateTime createdAt;

  const Article({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.author,
    required this.imageUrl,
    required this.createdAt,
  });

  static List<Article> articles = [
    Article(
      id: '1',
      title: 'Lorem Ipsum',
      subtitle:
          'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
      body:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut ex turpis. Duis odio nibh, bibendum ut pharetra non, laoreet nec elit. Vestibulum non neque ante. Sed non magna erat. Pellentesque quis ex porta, pretium tortor eu, eleifend lectus. Curabitur ultricies tristique maximus. Morbi lobortis vehicula dignissim. Proin cursus, tortor in malesuada sagittis, lorem ipsum porta risus, at sodales mi quam ut nisi. Aenean metus libero, venenatis vitae nibh vitae, porttitor iaculis purus. In est libero, tempus tempus purus sit amet, consequat faucibus ligula. Aliquam quis leo lacinia, euismod nibh sit amet, lacinia magna. Mauris laoreet nulla in libero tincidunt mollis.',
      author: 'Author 1',
      imageUrl: 'https://via.placeholder.com/150',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '2',
      title: 'Lorem Ipsum 2',
      subtitle:
          '2 Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
      body:
          '2 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut ex turpis. Duis odio nibh, bibendum ut pharetra non, laoreet nec elit. Vestibulum non neque ante. Sed non magna erat. Pellentesque quis ex porta, pretium tortor eu, eleifend lectus. Curabitur ultricies tristique maximus. Morbi lobortis vehicula dignissim. Proin cursus, tortor in malesuada sagittis, lorem ipsum porta risus, at sodales mi quam ut nisi. Aenean metus libero, venenatis vitae nibh vitae, porttitor iaculis purus. In est libero, tempus tempus purus sit amet, consequat faucibus ligula. Aliquam quis leo lacinia, euismod nibh sit amet, lacinia magna. Mauris laoreet nulla in libero tincidunt mollis.',
      author: 'Author 2',
      imageUrl: 'https://via.placeholder.com/150',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Article(
      id: '3',
      title: 'Lorem Ipsum 3',
      subtitle:
          '3 Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...',
      body:
          '3 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ut ex turpis. Duis odio nibh, bibendum ut pharetra non, laoreet nec elit. Vestibulum non neque ante. Sed non magna erat. Pellentesque quis ex porta, pretium tortor eu, eleifend lectus. Curabitur ultricies tristique maximus. Morbi lobortis vehicula dignissim. Proin cursus, tortor in malesuada sagittis, lorem ipsum porta risus, at sodales mi quam ut nisi. Aenean metus libero, venenatis vitae nibh vitae, porttitor iaculis purus. In est libero, tempus tempus purus sit amet, consequat faucibus ligula. Aliquam quis leo lacinia, euismod nibh sit amet, lacinia magna. Mauris laoreet nulla in libero tincidunt mollis.',
      author: 'Author 3',
      imageUrl: 'https://via.placeholder.com/150',
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
  ];

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, subtitle, body, author, imageUrl, createdAt];
}
