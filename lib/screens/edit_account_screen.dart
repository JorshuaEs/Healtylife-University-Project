// EditAccountScreen.dart

import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class EditAccountScreen extends StatelessWidget {
  static const String routeName = '/editInformation';

  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

   EditAccountScreen({Key? key}) : super(key: key);

  void _saveGeneralInfo(BuildContext context) async {
    String name = nameController.text;
    String age = ageController.text;
    String weight = weightController.text;
    String height = heightController.text;

    if (name.isEmpty || age.isEmpty || weight.isEmpty || height.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    try {
      DatabaseReference userRef = FirebaseDatabase.instance.ref().child('User').child('1');
      await userRef.update({
        'nombre': name,
        'edad': age,
        'peso': weight,
        'estatura': height,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Information updated successfully')),
      );

      // Regresar a la pantalla anterior (AccountScreen) y pasar los datos actualizados
      Navigator.pop(context, {
        'nombre': name,
        'edad': age,
        'peso': weight,
        'estatura': height,
        'correo': emailController.text,
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating information: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? accountInfo = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (accountInfo != null) {
      nameController.text = accountInfo['nombre'] ?? '';
      ageController.text = accountInfo['edad'] ?? '';
      weightController.text = accountInfo['peso'] ?? '';
      heightController.text = accountInfo['estatura'] ?? '';
      emailController.text = accountInfo['correo'] ?? '';
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Information'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'INFORMATION:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'General',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Card(
              child: ListTile(
                title: TextFormField(
                  controller: nameController,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: TextFormField(
                  controller: ageController,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    labelText: 'Age',
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: TextFormField(
                  controller: weightController,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    labelText: 'Weight (kg)',
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: TextFormField(
                  controller: heightController,
                  style: const TextStyle(fontSize: 14),
                  decoration: const InputDecoration(
                    labelText: 'Height (cm)',
                    labelStyle: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _saveGeneralInfo(context),
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
