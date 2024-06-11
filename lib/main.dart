import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2024/gyroscope/direction_vector.dart';
import 'game.dart';
import 'package:hackathon_2024/ClockWidget.dart';
import 'ClockWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: unused_local_variable
  final gyroscopeStream = registerGyroscope();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.blue,
          child: GameWidget(
            game: MyGame(), // Embed the Flame game here
          ),
        ),
      ),
    );
  }
}
