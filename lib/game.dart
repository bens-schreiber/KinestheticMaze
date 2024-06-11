import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2024/car.dart';
import 'package:hackathon_2024/gyroscope/direction_vector.dart';
import 'player.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame
    with TapDetector, VerticalDragDetector, HorizontalDragDetector {
  final double characterSize = 100.0;
  late Player player;
  late Car car;
  @override
  Future<void> onLoad() async {
    super.onLoad();
    player = Player()
      ..sprite = await Sprite.load('player.png')
      ..size = Vector2(characterSize, characterSize)
      ..position = Vector2(characterSize / 2, characterSize / 2);
    car = Car()
      ..sprite = await Sprite.load('car.png')
      ..size = Vector2(characterSize, characterSize)
      ..position = Vector2(characterSize / 2, characterSize / 2);
    add(car);
    add(player);
  }

  @override
  void onTapDown(TapDownInfo info) {
    player.startMove();
  }

  @override
  void onTapUp(TapUpInfo info) {
    player.stopMove();
  }

  @override
  void onHorizontalDragEnd(DragEndInfo info) {
    player.stopMove();
  }

  @override
  void onVerticalDragEnd(DragEndInfo info) {
    player.stopMove();
  }

  @override
  void update(double dt) {
    super.update(dt);
    directionVectorStream.first.then((value) => player.move(value));
    car.move(Vector2(4, 0));

    if(car.position.x > size.x){
      car.position = Vector2(0, 0);
    }
    
  }
}
