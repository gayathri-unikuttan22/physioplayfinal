import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';
import '../components/background_component.dart';
import '../components/bird_component.dart';
import '../components/bottomtube_component.dart';
import '../components/toptube_component.dart';

FlappyBird flappyBird = FlappyBird();

class FlappyBird extends FlameGame with HasTappables, HasCollisionDetection {
  bool isGamePaused = true;
  int score = 0;
  late TextComponent scoreComponent;
  @override
  FutureOr<void> onLoad() async {
    await super.onLoad();

    // Load audio
    FlameAudio.audioCache.loadAll(['flappySound.mp3']);

    // Background
    add(BackgroundComponent());

    // Bird
    add(bird);

    // Bottomtube , Total Gap is 0.60
    add(BottomtubeComponent(0.30));

    // Toptube
    add(ToptubeComponent(0.30));

    // Score

    TextPaint scoreComponentPaint = TextPaint(
        style: const TextStyle(
            fontSize: 60,
            color: Color.fromARGB(255, 246, 218, 5),
            fontFamily: 'RubikMicrobe',
            fontWeight: FontWeight.w700));

    scoreComponent = TextComponent(
        text: "${score}",
        position: Vector2(size[0] / 2, 0),
        textRenderer: scoreComponentPaint);

    add(scoreComponent);

    // Overlay - StartMenu
    overlays.add('InstructionPage');
  }

  @override
  void update(double dt) {
    super.update(dt);

    // Score Update
    scoreComponent.text = '${score}';

    // Game Paused
    if (isGamePaused) return;

    // face
    if (changer.selectedOpt_quiz == 1) {
      changer.selectedOpt_quiz = 0;
      changer.notify();
      bird.position.y -= 70;
    }
  }

  void reset() {
    score = 0;
    bird.position.y = size[1] / 2;

    // Remove all components
    children.forEach((child) {
      if (child is ToptubeComponent || child is BottomtubeComponent)
        remove(child);
    });

    // Add the inital tubes
    add(ToptubeComponent(0.30));
    add(BottomtubeComponent(0.30));
  }
}
