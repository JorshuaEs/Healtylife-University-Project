import 'package:flutter/material.dart';

class BotellaScreen extends StatefulWidget {
  const BotellaScreen({Key? key}) : super(key: key);

  static const String routeName = '/Botella';

  @override
  _BotellaScreenState createState() => _BotellaScreenState();
}

class _BotellaScreenState extends State<BotellaScreen> {
  bool _showGif = true;

  @override
  void initState() {
    super.initState();
    // Ocultar el GIF después de 2 segundos
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showGif = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('glasses of water the day'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Utilizar un Stack para superponer el GIF y la imagen
            Stack(
              children: [
                // Mostrar el GIF si _showGif es true
                Visibility(
                  visible: _showGif,
                  child: Image.asset('assets/images/botella.gif'),
                ),
                // Mostrar la imagen estática si _showGif es false
                Visibility(
                  visible: !_showGif,
                  child: Image.asset(
                      'assets/images/healtylife_img.png'), // Reemplaza 'botella_static.png' con el nombre de tu imagen estática
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
