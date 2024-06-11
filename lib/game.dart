import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'player.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame with TapDetector {
  final double characterSize = 100.0;
  double x = 2;
  double y = 2;
  late Player player;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    player = Player()
      ..sprite = await Sprite.load('player.png')
      ..size = Vector2(characterSize, characterSize)
      ..position = Vector2(characterSize / 2, characterSize / 2);

    add(player);
  }

  @override
  void onTapDown(TapDownInfo info) {
    player.isMoving = true;
    player.startMove();
  }

  @override
  void onTapUp(TapUpInfo info) {
    player.isMoving = false;
    player.stopMove();
  }

  @override
  void update(double dt) {
    super.update(dt);
    player.move(x, y);
  }
}
