import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

class Player extends SpriteComponent with HasGameRef, CollisionCallbacks {
  bool isMoving = false;
  late ShapeHitbox hitbox;

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

  @override
  void onLoad() {
    super.onLoad();
    hitbox = RectangleHitbox()
      ..width = width * 0.8
      ..height = height * 0.8;
    add(hitbox);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    isMoving = false;
    position = Vector2(0, 0);
  }
}
