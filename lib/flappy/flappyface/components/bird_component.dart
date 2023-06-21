import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter_proj/flappy/flappyface/components/background_component.dart';
import 'package:flutter_proj/flappy/flappyface/components/bottomtube_component.dart';
import 'package:flutter_proj/flappy/flappyface/components/toptube_component.dart';
import 'package:flutter_proj/flappy/flappyface/game/flappy_bird.dart';

enum BirdWingsState { up, down }

BirdComponent bird = BirdComponent(); // We use this global variable

class BirdComponent extends SpriteGroupComponent<BirdWingsState>
    with HasGameRef<FlappyBird>, CollisionCallbacks {
  bool wingsDown = true;
  late double birdHeight;
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();
    // Screen
    double screenHeight = gameRef.size[1];
    birdHeight = screenHeight * 0.05;

    Sprite birdWingUp = await gameRef.loadSprite('bird.png');
    Sprite birdWingDown = await gameRef.loadSprite('bird2.png');

    sprites = {
      BirdWingsState.down: birdWingDown,
      BirdWingsState.up: birdWingUp
    };

    current = BirdWingsState.down;

    position = gameRef.size / 2;
    height = width = birdHeight;
    anchor = Anchor.center;

    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Game Paused
    if (gameRef.isGamePaused) return;

    // Changing wings to make it look fly
    if (wingsDown) {
      wingsDown = false;
      current = BirdWingsState.up;
    } else {
      wingsDown = true;
      current = BirdWingsState.down;
    }

    position.y += 0.75;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if ((other is ToptubeComponent || other is BottomtubeComponent) &&
        gameRef.isGamePaused == false) {
      FlameAudio.play('flappySound.mp3');
      gameRef.isGamePaused = true;

      // GameOverMenu overlay
      gameRef.overlays.add('GameOverMenu');
    }
  }
}
