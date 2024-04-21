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
    MenuOption(
<<<<<<< HEAD
      title: 'Vasos de Agua al Dia',
      icon: Icons.article,
      route: '/Botella',
      screen: const ArticleHomeScreen(),
=======
      title: 'Settings',
      icon: Icons.build_outlined,
      route: '/settings',
      screen: const SettingsScreen(),
>>>>>>> 8d876210408e1bd8873a3b3e4aa910b44b1b95ce
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
