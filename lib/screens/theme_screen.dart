import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:healty_life/screens/theme_changer_screen.dart';

class ThemeScreen extends StatelessWidget {
  static const String routeName = ThemeChanger.routeName;

  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);

  return Scaffold(
      appBar: AppBar(
        title: Text('Theme'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.wb_sunny),
            title: Text('Light Theme'),
            onTap: () {
              themeChanger.setTheme(ThemeData.light());
            },
          ),
          ListTile(
            leading: Icon(Icons.nights_stay),
            title: Text('Dark Theme'),
            onTap: () {
              themeChanger.setTheme(ThemeData.dark());
            },
          ),
        ],
      ),
    );

  }
}
