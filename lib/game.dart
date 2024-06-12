import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2024/gyroscope/direction_vector.dart';
import 'package:hackathon_2024/wall.dart';
import 'wall_collidable.dart';
import 'crosswalk_collidable.dart';
import 'target_collidable.dart';
import 'player.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame
    with
        TapDetector,
        VerticalDragDetector,
        HorizontalDragDetector,
        HasCollisionDetection {
  final double characterSize = 32.0;
  late Player player;
  double x = 1.0;
  double y = 2.0;
  Vector2 recSize = Vector2(40, 40);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    player = Player()
      ..sprite = await Sprite.load('player.png')
      ..size = Vector2(characterSize, characterSize)
      ..position = Vector2(0, 0);

     final homePage = await TiledComponent.load('map.tmx', Vector2.all(32));

     List<TiledObject> walls = homePage.tileMap.getLayer<ObjectGroup>('walls')!.objects;

     for(final wall in walls){
        add(Wall(wall));
    }
    
   // add(homePage);
    add(player);
    //add(WallCollidable(canvasSize / 2, recSize));
    //add(CrosswalkCollidable(canvasSize / 3, recSize));
    //add(TargetCollidable(canvasSize / 4, recSize));
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
    //Comment this out to use emulator rather than tablet
    // directionVectorStream.first.then((value) => player.move(value));
    player.move(Vector2(x, y));
  }
}
