import 'package:flutter/material.dart';

import 'package:healty_life/routes/app_routes.dart';
import 'package:healty_life/screens/screens.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Text('Articles'),
      ),*/
      body: ListView(padding: EdgeInsets.zero, children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(
                      'https://cdn.pixabay.com/photo/2024/01/22/20/10/bark-8526227_1280.jpg'),
                  fit: BoxFit.cover)),
        )
      ]),
    );
  }
}
