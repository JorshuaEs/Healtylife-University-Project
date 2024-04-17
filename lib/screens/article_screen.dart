import 'package:flutter/material.dart';
import 'package:healty_life/widgets/widgets.dart';
import 'package:healty_life/routes/app_routes.dart';
import 'package:healty_life/screens/screens.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
          ],
        )
      ]),
    );
  }
}
