import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:healty_life/screens/calorias_screen.dart';
//import 'package:healty_life/screens/botella_screen.dart';
//import 'package:healty_life/routes/app_routes.dart';
import 'package:healty_life/screens/home_screen.dart';
import 'package:healty_life/screens/settings_screen.dart';

import 'screens/screens.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        SettingsScreen.routeName: (context) => const SettingsScreen()
      },
    );
  }
}
