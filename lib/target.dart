import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:tiled/tiled.dart';

class Target extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final TiledObject target;

  Target(this.target);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('target.png');
    size = Vector2(target.width, target.height);
    debugMode = true;
    position = Vector2(target.x, target.y);
    add(RectangleHitbox(
        size: Vector2(target.width, target.height),
        anchor: Anchor.center,
        position: Vector2(target.width / 2, target.height / 2)));
  }
}
