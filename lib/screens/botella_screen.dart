import 'dart:async';
import 'package:flutter/material.dart';

class BotellaScreen extends StatefulWidget {
  const BotellaScreen({Key? key}) : super(key: key);

  static const String routeName = '/Botella';

  @override
  _BotellaScreenState createState() => _BotellaScreenState();
}

class _BotellaScreenState extends State<BotellaScreen> {
  int _currentImageIndex = 0;
  late Timer _timer;
  final TextEditingController _controller = TextEditingController();
  int _duration = 2;
  bool _isAnimating = false;
  int _elapsedSeconds = 0;

  final List<String> _images = [
    'assets/images/botella1.png',
    'assets/images/botella2.png',
    'assets/images/botella3.png',
    'assets/images/botella4.png',
    'assets/images/botella5.png',
    'assets/images/botella6.png',
    'assets/images/botella7.png',
    'assets/images/botella8.png',
  ];

  final List<String> _texts = [
    'Drink Your First Glass of Water',
    'Drink Your Second Glass of Water',
    'Drink Your Third Glass of Water',
    'Drink Your Fourth Glass of Water',
    'Drink Your Fifth Glass of Water',
    'Drink Your Sixth Glass of Water',
    'Drink Your Seventh Glass of Water',
    'Drink Your Eighth Glass of Water',
  ];

  @override
  void initState() {
    super.initState();
  }

  void _startTimer() {
    _elapsedSeconds = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        _elapsedSeconds++;
        if (_elapsedSeconds % _duration == 0) {
          if (_currentImageIndex < _images.length - 1) {
            _currentImageIndex++;
          } else {
            _timer.cancel();
            setState(() {
              _isAnimating = false;
            });
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WATER CONTROL'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: 'ENTER YOUR TIME',
                      border: OutlineInputBorder(),
                    ),
                    enabled: !_isAnimating,
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _isAnimating
                      ? null
                      : () {
                          setState(() {
                            _duration = int.parse(_controller.text);
                            _currentImageIndex = 0;
                            _isAnimating = true;
                            _startTimer();
                          });
                        },
                  child: const Text('START'),
                ),
              ],
            ),
          ),
          Text(
            'TIME $_elapsedSeconds H',
            style: const TextStyle(fontSize: 20),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: _images.asMap().entries.map((entry) {
                int index = entry.key;
                String imagePath = entry.value;

                return AnimatedOpacity(
                  opacity: _currentImageIndex == index ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _texts[index],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
