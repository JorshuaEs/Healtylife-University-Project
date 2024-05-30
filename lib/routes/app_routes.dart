import 'package:flutter/material.dart';
import 'package:healty_life/screens/calorias_screen.dart';
import 'package:healty_life/utils/utils.dart';
export 'package:healty_life/routes/app_routes.dart';

/*import 'package:healty_life/screens/loading_screen.dart';*/

import 'package:healty_life/screens/screens.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

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
      title: 'Glasses of water the day',
      icon: Icons.water_outlined,
      route: '/Botella',
      screen: const BotellaScreen(),
    ),
    MenuOption(
      title: 'Calories',
      icon: Icons.food_bank,
      route: '/Calorias',
      screen: CaloriesScreen(),
    ),
    MenuOption(
      title: 'Articles',
      icon: Icons.article,
      route: '/articlesHome',
      screen: const ArticleHomeScreen(),
    ),
    MenuOption(
      title: 'Settings',
      icon: Icons.build_outlined,
      route: '/settings',
      screen: const SettingsScreen(),
    ),
    MenuOption(
      title: 'Rate us',
      icon: Icons.star,
      /*route: '/Sizedbox',
      screen: const SizedBox(),*/
      onTap: () {
        print('111111111111111111111111111111111111111111111111111111111111');
        /*_showRateUsDialog();*/
      },
    ),
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});
    for (final option in menuOptions) {
      appRoutes
          .addAll({option.route!: (BuildContext context) => option.screen!});
    }
    return appRoutes;
  }
}
/*
void _showRateUsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Rate Us"),
        content: Text("How would you rate our app?"),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // Aquí puedes implementar la lógica para abrir la tienda de aplicaciones para que el usuario califique tu aplicación.
              Navigator.of(context).pop();
            },
            child: Text("Rate Now"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Later"),
          ),
        ],
      );
    },
  );
}*/
