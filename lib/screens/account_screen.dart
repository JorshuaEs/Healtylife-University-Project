import 'package:flutter/material.dart';
import 'package:healty_life/screens/edit_account_screen.dart';

class AccountScreen extends StatelessWidget {
  static const String routeName = '/account';

  const AccountScreen({Key? key});


  @override

  Widget build(BuildContext context) {
    // Datos de la cuenta
    Map<String, String> accountInfo = {
      'nombre': 'Ditto',
      'edad': '21',
      'peso': '4 kg',
      'estatura': '30 cm',
      'correo': 'example@example.com',
      'contraseña': '*********',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
      ),
      body: Stack(
        children: [
          const Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: CircleAvatar(
                radius: 100, // Aumenta el radio para hacer más grande el círculo
                backgroundImage: AssetImage('assets/images/ditto.jpeg'),
              ),
            ),
          ),
          ListView(
            padding: const EdgeInsets.fromLTRB(8.0, 240.0, 8.0, 8.0), // Ajusta el padding para que no se solape con el círculo
            children: [
              Text(
                'General',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                style: TextStyle(fontSize: 20,
                 fontWeight: FontWeight.bold
                 ),
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
                  // Navega a la pantalla de edición, pasando los datos de la cuenta como un Map
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
