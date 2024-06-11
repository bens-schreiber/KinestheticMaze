import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'CardExample.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Container(
      color: Colors.blue, child: const CardExample()),
      title: 'myApp',);
  }
}
