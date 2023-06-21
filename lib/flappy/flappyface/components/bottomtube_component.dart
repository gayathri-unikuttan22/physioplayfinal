import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_proj/flappy/flappyface/components/bird_component.dart';
import 'package:flutter_proj/flappy/flappyface/game/flappy_bird.dart';

// Total gap is 0.40
class BottomtubeComponent extends SpriteComponent with HasGameRef<FlappyBird> {
  late double tubeHeight;
  late double tubeWidth;
  late double screenWidth;
  late double screenHeight;
  late double gap;

  BottomtubeComponent(this.gap);

  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    // Screen
    screenWidth = gameRef.size[0];
    screenHeight = gameRef.size[1];

    // Width and Height
    tubeHeight = screenHeight;
    tubeWidth = tubeHeight * 0.09;

    sprite = await gameRef.loadSprite('bottomtube.png');
    height = tubeHeight;
    width = tubeWidth;
    position = Vector2(
        screenWidth + (screenWidth * 0.20),
        (screenHeight / 2) +
            ((screenHeight / 2) * gap)); // 20 percentage in y axis
    anchor = Anchor.topCenter;

    add(RectangleHitbox());
  }

  void update(double dt) {
    super.update(dt);
    // Game Paused
    if (gameRef.isGamePaused) return;
    // Position changing with 10 percent
    if (position.x < (0 - screenWidth * 0.10)) {
      removeFromParent();
    } else {
      position.x -= 3;
    }
  }
}
