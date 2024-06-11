import 'package:flame/components.dart';

class Car extends SpriteComponent with HasGameRef {

  void move(Vector2 movement) {
      position.add(movement);

    }
  }