import 'package:flutter/material.dart';
import '../widgets/custom_input_field.dart'; // Asegúrate de tener este archivo

class CaloriesScreen extends StatefulWidget {
  static const String routeName = '/Calories';

  @override
  _CaloriesScreenState createState() => _CaloriesScreenState();
}

class _CaloriesScreenState extends State<CaloriesScreen> {
  final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();
  final Map<String, String> formValues = {
    'weight': '70',
    'height': '170',
    'age': '25',
    'sex': 'male',
  };
  double caloriesBurned = 0;

  void calculateCalories() {
    final double weight = double.parse(formValues['weight'] ?? '70');
    final double height = double.parse(formValues['height'] ?? '170');
    final int age = int.parse(formValues['age'] ?? '25');
    final String sex = formValues['sex'] ?? 'male';

    double bmr;

    if (sex == 'male') {
      bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }

    // Factor de actividad: moderado (ejercicio 3-4 días a la semana)
    double activityFactor = 1.55;

    setState(() {
      caloriesBurned = bmr * activityFactor;
    });

    print(
        'Peso: $weight, Altura: $height, Edad: $age, Sexo: $sex, calcular: $caloriesBurned');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingresa tus Datos'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Form(
            key: myFormKey,
            child: Column(
              children: [
                CustomInputField(
                  labelText: 'Peso (kg)',
                  hintText: 'Ej. 70',
                  keyboardType: TextInputType.number,
                  formProperty: 'weight',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Altura (cm)',
                  hintText: 'Ej. 170',
                  keyboardType: TextInputType.number,
                  formProperty: 'height',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  labelText: 'Edad (años)',
                  hintText: 'Ej. 25',
                  keyboardType: TextInputType.number,
                  formProperty: 'age',
                  formValues: formValues,
                ),
                const SizedBox(height: 30),
                DropdownButtonFormField<String>(
                  value: formValues['sex'],
                  items: const [
                    DropdownMenuItem(value: 'male', child: Text('Hombre')),
                    DropdownMenuItem(value: 'female', child: Text('Mujer')),
                  ],
                  onChanged: (value) {
                    formValues['sex'] = value ?? 'male';
                  },
                  decoration: InputDecoration(
                    labelText: 'Sexo',
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(child: Text('Calcular Calorías a Quemar')),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario no válido');
                      return;
                    }

                    myFormKey.currentState!.save();
                    calculateCalories();
                  },
                ),
                const SizedBox(height: 30),
                if (caloriesBurned > 0)
                  Text(
                    'Debes quemar: ${caloriesBurned.toStringAsFixed(2)} Calorias',
                    style: TextStyle(fontSize: 18, color: Colors.red),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
