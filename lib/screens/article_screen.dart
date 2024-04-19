import 'package:flutter/material.dart';
import 'package:healty_life/models/article_model.dart';
import 'package:healty_life/widgets/widgets.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static const String routeName = '/article';
  @override
  Widget build(BuildContext context) {
    final Article article =
        ModalRoute.of(context)!.settings.arguments as Article;
    return ImageContainer(
      width: double.infinity,
      imageUrl: article.imageUrl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Colors.transparent,
            elevation: 0),
        extendBodyBehindAppBar: true,
        body: ListView(
          children: [
            _ArticleHeadline(
              article: article,
            )
          ],
        ),
      ),
    );
  }
}

class _ArticleHeadline extends StatelessWidget {
  const _ArticleHeadline({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(article.category,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      )),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            article.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1.25,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            article.subtitle,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.white,
                ),
          ),
        ],
      ),
    );
  }
}
