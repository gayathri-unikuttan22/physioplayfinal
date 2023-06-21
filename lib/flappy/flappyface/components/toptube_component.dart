import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_proj/flappy/flappyface/game/flappy_bird.dart';

import '../../../main.dart';
import 'bird_component.dart';
import 'bottomtube_component.dart';
import 'dart:math';

class ToptubeComponent extends SpriteComponent with HasGameRef<FlappyBird> {
  late double tubeHeight;
  late double tubeWidth;
  late double screenWidth;
  late double screenHeight;
  late double gap;
  late bool midWay;

  ToptubeComponent(this.gap);
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    // midWay
    midWay = false;

    // Screen
    screenWidth = gameRef.size[0];
    screenHeight = gameRef.size[1];

    // Width and Height
    tubeHeight = screenHeight;
    tubeWidth = tubeHeight * 0.09;

    sprite = await gameRef.loadSprite('toptube.png');
    height = tubeHeight;
    width = tubeWidth;
    position = Vector2(
        screenWidth + (screenWidth * 0.20),
        (screenHeight / 2) -
            ((screenHeight / 2) * gap)); // 20 percentage in y axis
    anchor = Anchor.bottomCenter;

    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Game Paused
    if (gameRef.isGamePaused) return;
    // Position changing with 10 percent

    if (position.x < (screenWidth - (screenWidth * 0.65)) && !midWay) {
      // Score Increment
      gameRef.score += 1;

      // Score Update
      final newText = "${gameRef.score}";
      gameRef.scoreComponent.text = newText;

      // Adding new tubes
      midWay = true;
      var list1 = [.10, .20, .30, .40, .50]; // Gaps

      // Random random = Random();
      // int randomValue = random.nextInt(list1.length);

      // x + y = 0.60
      double x = list1[changer.currentBar];
      double y = 0.60 - x;

      changer.currentBar = (changer.currentBar +1) % list1.length;

      gameRef.add(ToptubeComponent(x));
      gameRef.add(BottomtubeComponent(y));
    }

    if (position.x < (0 - screenWidth * 0.10)) {
      // position.x = screenWidth + (screenWidth * 0.10);
      removeFromParent();
    } else {
      position.x -= 3;
    }
  }
}
