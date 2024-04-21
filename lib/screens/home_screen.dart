import 'package:flutter/material.dart';
import 'package:healty_life/routes/app_routes.dart';
import 'package:healty_life/screens/screens.dart';

/*class HomeScreen extends StatefulWidget { 
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<MenuOption> menuOptions = AppRoutes.menuOptions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('Usuario Prueba'),
              accountEmail: Text('hunter@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'U',
                  style: TextStyle(fontSize: 40.0),
                ),
              ),
            ),
            // Genera las listas en el drawer en base a AppRoutes.menuOptions
            ...menuOptions.map((option) => ListTile(
                  leading: Icon(option.icon),
                  title: Text(option.title),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, option.route);
                  },
                )),
          ],
        ),
      ),
    );
  }
}*/

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget _currentScreen;
  @override
  void initState() {
    super.initState();

    _currentScreen = const LoadingScreen();
  }

  Widget _getDrawer() {
    final List<MenuOption> menuOptions = AppRoutes.menuOptions;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Usuario Prueba'),
            accountEmail: Text('hunter@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                'U',
                style: TextStyle(fontSize: 40.0, color: Colors.black),
              ),
            ),
          ),
          ...menuOptions.map((option) => ListTile(
                leading: Icon(option.icon),
                title: Text(option.title!),
                onTap: () {
                  Navigator.pop(context);

                  setState(() {
                    _currentScreen = option.screen!;
                  });
                },
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: _getDrawer(),
      body: _currentScreen,
    );
  }
}
