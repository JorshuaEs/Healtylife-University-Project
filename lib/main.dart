import 'package:flutter/material.dart';
//import 'package:healty_life/routes/app_routes.dart';
import 'package:healty_life/screens/home_screen.dart';
import 'package:healty_life/screens/settings_screen.dart';

import 'screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HealtyLife',
      /*
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(),
    */
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ArticleHomeScreen.routeName: (context) => const ArticleHomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        BotellaScreen.routeName: (context) => const BotellaScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
      },
    );
  }
}
