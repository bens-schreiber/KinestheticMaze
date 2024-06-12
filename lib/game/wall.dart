import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';

class Wall extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final TiledObject wall;

  Wall(this.wall);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('wall.png');
    size = Vector2(wall.width, wall.height);
    debugMode = true;
    position = Vector2(wall.x, wall.y);
    add(RectangleHitbox(
        size: Vector2(wall.width, wall.height),
        anchor: Anchor.center,
        position: Vector2(wall.width / 2, wall.height / 2)));
  }
}
