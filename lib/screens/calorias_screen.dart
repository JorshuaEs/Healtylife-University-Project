import 'package:flutter/material.dart';

class CaloriesCalculatorScreen extends StatefulWidget {
  static const String routeName = '/Calories';
  @override
  _CaloriesCalculatorScreenState createState() =>
      _CaloriesCalculatorScreenState();
}

class _CaloriesCalculatorScreenState extends State<CaloriesCalculatorScreen> {
  double weight = 70; // Peso predeterminado en kilogramos
  double caloriesBurned = 0;

  // Función para calcular las calorías quemadas
  void calculateCaloriesBurned(double weight) {
    // Supongamos que quemamos aproximadamente 30 calorías por cada kilogramo de peso al día
    setState(() {
      caloriesBurned = weight * 30;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calories Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Ingrese su peso en kilogramos:',
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(
                hintText: 'Peso en kilogramos',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                calculateCaloriesBurned(weight);
              },
              child: Text('Calcular calorías quemadas'),
            ),
            SizedBox(height: 20),
            Text(
              'Calorías quemadas por día: $caloriesBurned',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
