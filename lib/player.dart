import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'wall_collidable.dart';

class Player extends SpriteComponent with HasGameRef, CollisionCallbacks {
  bool isMoving = false;
  late ShapeHitbox hitbox;
  Vector2 previousPosition = Vector2.zero();

  void startMove() {
    isMoving = true;
  }

  void stopMove() {
    isMoving = false;
  }

  void move(Vector2 movement) {
    if (isMoving) {
      previousPosition.setFrom(position);
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
    if (other is WallCollidable) {
      isMoving = false;
      position.setFrom(previousPosition); // Revert to previous position
    }
  }
}
