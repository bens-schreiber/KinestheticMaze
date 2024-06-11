import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameRef {
  bool isMoving = false;

  void startMove() {
    isMoving = true;
  }

  void stopMove() {
    isMoving = false;
  }

  void move(Vector2 movement) {
    if (isMoving) {
      position.add(movement);
    }
  }
}
