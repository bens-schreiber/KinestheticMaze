import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_2024/gyroscope/direction_vector.dart';
import 'package:hackathon_2024/overlay/overlay.dart';
import 'game/game.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // ignore: unused_local_variable
  final gyroscopeStream = registerGyroscope();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: GameOverlay(
          child: GameWidget(game: MyGame()),
        ));
  }
}
