export 'package:healty_life/utils/utils.dart';
import 'package:flutter/material.dart';

class Utils {
  static Future<void> showRatingPopup(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/healtylife_logo.png'),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Cerrar el diálogo actual
                  // Agrega aquí la lógica para dirigir al usuario a la tienda de aplicaciones u otra acción relacionada con la calificación de la aplicación
                },
                child: Text('Rate us'),
              ),
            ],
          ),
        );
      },
    );
  }
}
