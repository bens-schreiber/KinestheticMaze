import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameRef {
  bool isMoving = false;

  void startMove() {
    isMoving = true;
  }

  void stopMove() {
    isMoving = false;
  }
  void move(x, y) {
    if (isMoving) {
      position.add(Vector2(x, y));
    }
  }
}
