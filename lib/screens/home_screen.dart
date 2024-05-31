import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healty_life/routes/app_routes.dart';
import 'package:healty_life/screens/screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Widget _currentScreen;
  String userName = 'User';
  String userEmail = 'Por favor inicia sesion';
  User? currentUser;

  @override
  void initState() {
    super.initState();
    _currentScreen = const LoadingScreen();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        userEmail = currentUser!.email ?? 'Correo no disponible';

        DatabaseEvent event = await FirebaseDatabase.instance.ref().child('User').child('1').once();

        DataSnapshot snapshot = event.snapshot;

        if (snapshot.exists) {
          Map<String, dynamic> userData = Map<String, dynamic>.from(snapshot.value as Map);
          setState(() {
            userName = userData['nombre'] ?? 'Usuario';
          });
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Widget _getDrawer() {
    final List<MenuOption> menuOptions = AppRoutes.menuOptions;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                userName.isNotEmpty ? userName[0] : 'U',
                style: const TextStyle(fontSize: 40.0, color: Colors.black),
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
