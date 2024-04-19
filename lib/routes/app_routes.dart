import 'package:flutter/material.dart';

/*import 'package:healty_life/screens/loading_screen.dart';*/

import 'package:healty_life/screens/screens.dart';

class AppRoutes {
  static const String initialRoute = 'home';
  static final menuOptions = <MenuOption>[
    MenuOption(
      title: 'Loading',
      icon: Icons.access_time,
      route: '/loading',
      screen: const LoadingScreen(),
    ),
    MenuOption(
      title: 'Login',
      icon: Icons.login,
      route: '/login',
      screen: const LoginScreen(),
    ),
    MenuOption(
      title: 'Articles',
      icon: Icons.article,
      route: '/articlesHome',
      screen: const ArticleHomeScreen(),
    ),
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }
}
