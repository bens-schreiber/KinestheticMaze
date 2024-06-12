import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:tiled/tiled.dart';

class Crosswalk extends SpriteComponent with HasGameRef, CollisionCallbacks {
  final TiledObject crosswalk;

  Crosswalk(this.crosswalk);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('crosswalk.jpg');
    size = Vector2(crosswalk.width, crosswalk.height);
    debugMode = true;
    position = Vector2(crosswalk.x, crosswalk.y);
    add(RectangleHitbox(
        size: Vector2(crosswalk.width, crosswalk.height),
        anchor: Anchor.center,
        position: Vector2(crosswalk.width / 2, crosswalk.height / 2)));
  }
}
