import 'package:flutter/material.dart';

class BotellaScreen extends StatefulWidget {
  const BotellaScreen({Key? key}) : super(key: key);

  static const String routeName = '/Botella';

  @override
  _BotellaScreenState createState() => _BotellaScreenState();
}

class _BotellaScreenState extends State<BotellaScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8), // Duración de 8 segundos
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Image(
                    image: AssetImage('assets/images/botella.gif'),
                    fit: BoxFit.cover, // Ajustar la imagen para cubrir el área
                    frameBuilder:
                        (context, child, frame, wasSynchronouslyLoaded) {
                      if (wasSynchronouslyLoaded) {
                        return child;
                      }
                      return AnimatedOpacity(
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(milliseconds: 300),
                        child: child,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
