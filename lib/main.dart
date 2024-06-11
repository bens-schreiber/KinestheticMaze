import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2024/gyroscope/direction_vector.dart';
import 'package:hackathon_2024/gyroscope/gyroscope.dart';

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
    return const MaterialApp(
        home: Scaffold(
            body: Center(
      child: Gyroscope(),
    )));
  }
}
