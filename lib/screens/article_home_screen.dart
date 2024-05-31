import 'package:flutter/material.dart';
import 'package:healty_life/models/article_model.dart';
import 'package:healty_life/widgets/widgets.dart';
import 'package:healty_life/screens/screens.dart';

class ArticleHomeScreen extends StatefulWidget {
  const ArticleHomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/articlesHome';

  @override
  _ArticleHomeScreenState createState() => _ArticleHomeScreenState();
}

class _ArticleHomeScreenState extends State<ArticleHomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Article> _articles = [];
  List<Article> _filteredArticles = [];
  List<String> tabs = ['Health', 'Diets', 'Information', 'Tips'];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterArticles);
    _fetchArticles();
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterArticles);
    _searchController.dispose();
    super.dispose();
  }

  void _filterArticles() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredArticles = _articles.where((article) {
        return article.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> _fetchArticles() async {
    final articles = await Article.getArticles();
    setState(() {
      _articles = articles;
      _filteredArticles = articles;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        body: _articles.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _DiscoverArticle(searchController: _searchController),
                  _CategoryArticle(tabs: tabs, articles: _filteredArticles),
                ],
              ),
      ),
    );
  }
}

class _CategoryArticle extends StatefulWidget {
  const _CategoryArticle({
    Key? key,
    required this.tabs,
    required this.articles,
  }) : super(key: key);

  final List<String> tabs;
  final List<Article> articles;

  @override
  __CategoryArticleState createState() => __CategoryArticleState();
}

class __CategoryArticleState extends State<_CategoryArticle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          indicatorColor: Colors.black,
          tabs: widget.tabs
              .map((tab) => Tab(
                    child: Text(
                      tab,
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ))
              .toList(),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: TabBarView(
            children: widget.tabs.map((tab) {
              final filteredArticles = widget.articles
                  .where((article) => article.category == tab)
                  .toList();
              return ListView.builder(
                shrinkWrap: true,
                itemCount: filteredArticles.length,
                itemBuilder: (context, index) {
                  final article = filteredArticles[index];
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ArticleScreen.routeName,
                        arguments: article,
                      );
                    },
                    child: Row(
                      children: [
                        ImageContainer(
                          width: 80,
                          height: 80,
                          margin: const EdgeInsets.all(10.0),
                          borderRadius: 5,
                          imageUrl: article.imageUrl,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                article.title,
                                maxLines: 2,
                                overflow: TextOverflow.clip,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.schedule,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    '${article.createdAt}',
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
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class _DiscoverArticle extends StatelessWidget {
  const _DiscoverArticle({
    Key? key,
    required this.searchController,
  }) : super(key: key);

  final TextEditingController searchController;

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
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                ),
          ),
          const SizedBox(height: 5),
          Text(
            'Read the most interesting articles',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: searchController,
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
                ),
              ),
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
