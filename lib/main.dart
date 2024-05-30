import 'package:firebase_core/firebase_core.dart';
import 'package:healty_life/screens/account_screen.dart';
import 'package:healty_life/screens/edit_account_screen.dart';
import 'package:healty_life/screens/theme_changer_screen.dart';
import 'package:healty_life/screens/theme_screen.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:healty_life/screens/calorias_screen.dart';
import 'package:healty_life/screens/home_screen.dart';
import 'package:healty_life/screens/settings_screen.dart';

import 'screens/screens.dart';

Future<void> main() async {
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
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(ThemeData.light()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      theme: theme.getTheme(),
      title: 'HealtyLife',
      initialRoute: '/',
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        ArticleHomeScreen.routeName: (context) => const ArticleHomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        LoadingScreen.routeName: (context) => const LoadingScreen(),
        ArticleScreen.routeName: (context) => const ArticleScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        AccountScreen.routeName: (context) => const AccountScreen(),
        EditAccountScreen.routeName: (context) => const EditAccountScreen(),
        ThemeScreen.routeName: (context) => const ThemeScreen(),
      },
    );
  }
}
