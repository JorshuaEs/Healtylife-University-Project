import 'package:flutter/material.dart';
import 'package:healty_life/screens/account_screen.dart';
import 'package:healty_life/screens/calorias_screen.dart';
import 'package:healty_life/screens/edit_account_screen.dart';
import 'package:healty_life/screens/theme_screen.dart';
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
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    appRoutes.addAll({'home': (BuildContext context) => const HomeScreen()});

    for (final option in menuOptions) {
      appRoutes
          .addAll({option.route!: (BuildContext context) => option.screen!});
    }

    // Agrega la ruta para AccountScreen sin incluirla en menuOptions
    appRoutes.addAll({
      AccountScreen.routeName: (BuildContext context) => const AccountScreen()
    });
    appRoutes.addAll({
      EditAccountScreen.routeName: (BuildContext context) => EditAccountScreen()
    });
    appRoutes.addAll(
        {ThemeScreen.routeName: (BuildContext context) => const ThemeScreen()});
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
