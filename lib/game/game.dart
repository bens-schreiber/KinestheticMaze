import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_2024/game/car.dart';
import 'package:hackathon_2024/game/crosswalk.dart';
import 'package:hackathon_2024/game/finish.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_2024/game/player.dart';
import 'package:hackathon_2024/game/wall.dart';
import 'package:hackathon_2024/game/wall_collidable.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:hackathon_2024/gyroscope/direction_vector.dart';

void main() {
  runApp(GameWidget(game: MyGame()));
}

class MyGame extends FlameGame
    with
        TapDetector,
        VerticalDragDetector,
        HorizontalDragDetector,
        HasCollisionDetection,
        KeyboardEvents {
  final double characterSize = 24.0;
  late Player player;
  late Car car;
  double x = 1.0;
  double y = 2.0;
  Vector2 recSize = Vector2(40, 40);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    player = Player()
      ..sprite = await Sprite.load('player.png')
      ..size = Vector2(characterSize, characterSize)
      ..position = Vector2(50, 75);

    final homePage = await TiledComponent.load('map.tmx', Vector2.all(32));

    List<TiledObject> walls =
        homePage.tileMap.getLayer<ObjectGroup>('walls')!.objects;

    List<TiledObject> crosswalks =
        homePage.tileMap.getLayer<ObjectGroup>('crosswalk')!.objects;

    List<TiledObject> finishes =
        homePage.tileMap.getLayer<ObjectGroup>('finish')!.objects;

    for (final finish in finishes) {
      add(Finish(finish));
    }

    for (final crosswalk in crosswalks) {
      add(Crosswalk(crosswalk));
    }

    for (final wall in walls) {
      add(Wall(wall));
    }

    add(player);

    final Vector2 leftEnd = Vector2(00, 460);
    final Vector2 rightEnd = Vector2(450, 460);
    add(WallCollidable(leftEnd, recSize));
    add(WallCollidable(rightEnd, recSize));

    car = Car()
      ..sprite = await Sprite.load('car.png')
      ..size = Vector2(characterSize, characterSize)
      ..position = Vector2(80, 460);
    add(car);
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
  KeyEventResult onKeyEvent(
      KeyEvent event, Set<LogicalKeyboardKey> keysPressed) {
    final isKeyDown = event is KeyDownEvent;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      y = isKeyDown ? -10.0 : 0.0;
      player.startMove();
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      y = isKeyDown ? 10.0 : 0.0;
      player.startMove();
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      x = isKeyDown ? -10.0 : 0.0;
      player.startMove();
      return KeyEventResult.handled;
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      x = isKeyDown ? 10.0 : 0.0;
      player.startMove();
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  bool _waitVibrate = false;
  bool _waitSound = false;

  @override
  void update(double dt) {
    super.update(dt);
    //Comment this out to use emulator rather than tablet
    player.move(directionVectorCache);
    // player.move(Vector2(x, y));
    car.move();
    if (player.isCollidingWithCrosswalk && car.isMoving && !_waitSound) {
      _waitSound = true;
      FlameAudio.play('car-honk.mp3');
      Future.delayed(const Duration(milliseconds: 500), () {
        _waitSound = false;
      });
    }
    if (player.isCollidingWithCrosswalk && !_waitVibrate) {
      _waitVibrate = true;
      HapticFeedback.lightImpact();
      Future.delayed(const Duration(milliseconds: 250), () {
        _waitVibrate = false;
      });
    }
  }
}
