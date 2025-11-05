import 'package:flame/components.dart';
import 'package:flappy_dash/common/score_formatter.dart';
import 'package:flappy_dash/features/game/components/explosion.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flutter/material.dart';

class ScoreDisplay extends TextComponent with HasGameReference<FlappyDashGame> {
  ScoreDisplay()
    : super(
        key: scoreKey,
        anchor: Anchor.center,
        textRenderer: TextPaint(
          style: const TextStyle(
            color: Colors.yellow,
            fontSize: 64,
          ),
        ),
      );

  static final scoreKey = ComponentKey.unique();

  @override
  Future<void> onLoad() async {
    text = ScoreFormatter.format(game.progress.score);

    position = Vector2(0, -game.size.y / 2 + 100);

    super.onLoad();
  }

  @override
  Future<void> update(double dt) async {
    final currentlyDisplayedScore = int.tryParse(text);
    final currentScore = game.progress.score;

    if (currentlyDisplayedScore != null &&
        currentlyDisplayedScore != currentScore) {
      add(
        Explosion(
          position: Vector2(
            size.x / 2,
            size.y / 2,
          ),
        ),
      );

      // Let's wait for explosion to start before updating the score
      await Future<void>.delayed(const Duration(milliseconds: 150));

      text = ScoreFormatter.format(game.progress.score);
    }

    super.update(dt);
  }
}
