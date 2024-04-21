import 'package:flutter/material.dart';
import 'package:healty_life/models/article_model.dart';
import 'package:healty_life/widgets/widgets.dart';

import 'package:healty_life/screens/screens.dart';

class ArticleHomeScreen extends StatelessWidget {
  const ArticleHomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/articlesHome';

  @override
  Widget build(BuildContext context) {
    List<String> tabs = ['Salud', 'Dietas', 'Informacion', 'Tips'];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        /*appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),*/
        body: ListView(
            padding: const EdgeInsets.all(20),
            children: [const _DiscoverArticle(), _CategoryArticle(tabs: tabs)]),
      ),
    );
  }
}

class _CategoryArticle extends StatelessWidget {
  const _CategoryArticle({
    super.key,
    required this.tabs,
  });

  final List<String> tabs;

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;

    return Column(
      children: [
        TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            tabs: tabs
                .map(
                  (tab) => Tab(
                    icon: Text(tab,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                  ),
                )
                .toList()),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: tabs
                .map(
                  (tab) => ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, ArticleScreen.routeName,
                              arguments: articles[index]);
                        },
                        child: Row(
                          children: [
                            ImageContainer(
                              width: 80,
                              height: 80,
                              margin: const EdgeInsets.all(10.0),
                              borderRadius: 5,
                              imageUrl: articles[index].imageUrl,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(articles[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.clip,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.bold,
                                          )),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.schedule,
                                        color: Colors.grey,
                                        size: 18,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

class _DiscoverArticle extends StatelessWidget {
  const _DiscoverArticle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Articles',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 5),
          Text(
            'Read the most interesting articles',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              suffixIcon: const RotatedBox(
                  quarterTurns: 1,
                  child: Icon(
                    Icons.tune,
                    color: Colors.grey,
                  )),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
