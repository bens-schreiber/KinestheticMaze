import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2024/ClockWidget.dart';
import 'ClockWidget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( title: 'myApp', home: Scaffold(body: Container(
      color: Colors.blue,
      width: double.infinity,
       child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClockWidget(),
        ],
      )
     )));
  }
}
