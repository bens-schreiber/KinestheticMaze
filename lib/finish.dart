import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:tiled/tiled.dart';

class Finish extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final TiledObject finish;

  Finish(this.finish);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('finish.jpg');
    size = Vector2(finish.width, finish.height);
    debugMode = true;
    position = Vector2(finish.x, finish.y);
    add(RectangleHitbox(
        size: Vector2(finish.width, finish.height),
        anchor: Anchor.center,
        position: Vector2(finish.width / 2, finish.height / 2)));
  }
}
