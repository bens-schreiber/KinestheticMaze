import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:hackathon_2024/game/wall_collidable.dart';

class Car extends SpriteComponent with HasGameRef, CollisionCallbacks {
  late ShapeHitbox hitbox;
  Vector2 direction = Vector2(35, 0);
  bool isMoving = true;
  late int carCounter = 0;
  void move() {
    if (isMoving) {
      position.add(direction);
    }
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    hitbox = RectangleHitbox()
      ..width = width * 0.8
      ..height = height * 0.8;
    add(hitbox);
  }

  @override
  Future<void> onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) async {
    super.onCollisionStart(intersectionPoints, other);
    if (other is WallCollidable) {
      if (carCounter == 6) {
        isMoving = false;
        Future.delayed(const Duration(seconds: 3), () {
          if (!isMoving) {
            isMoving = true;
            carCounter = 0;
          }
        });
      }
      direction = -direction;
      angle += 3.14159;
      carCounter++;
    }
  }
}
