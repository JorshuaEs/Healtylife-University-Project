import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:healty_life/screens/edit_account_screen.dart';

class AccountScreen extends StatefulWidget {
  static const String routeName = '/account';

  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Map<String, dynamic> accountInfo = {};
  User? currentUser;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      // Obtener el usuario autenticado
      currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        DatabaseEvent event = await FirebaseDatabase.instance.ref().child('User').child('1').once();

        DataSnapshot snapshot = event.snapshot;

        if (snapshot.exists) {
          setState(() {
            accountInfo = Map<String, dynamic>.from(snapshot.value as Map);
            accountInfo['correo'] = currentUser!.email;
            accountInfo['contraseña'] = '********';
          });
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: accountInfo.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Stack(
              children: [
                const Positioned(
                  top: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage('assets/images/ditto.jpeg'),
                    ),
                  ),
                ),
                ListView(
                  padding: const EdgeInsets.fromLTRB(8.0, 240.0, 8.0, 8.0),
                  children: [
                    Text(
                      'General',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nombre: ${accountInfo['nombre']}'),
                              Text('Edad: ${accountInfo['edad']}'),
                              Text('Peso: ${accountInfo['peso']}'),
                              Text('Estatura: ${accountInfo['estatura']}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      'Cuenta',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    SizedBox(
                      width: double.infinity,
                      child: Card(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Correo: ${accountInfo['correo']}'),
                              Text('Contraseña: ${accountInfo['contraseña']}'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          EditAccountScreen.routeName,
                          arguments: accountInfo,
                        );
                      },
                      child: const Text('Editar Información'),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
