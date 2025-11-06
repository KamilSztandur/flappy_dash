import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/common/score_formatter.dart';
import 'package:flappy_dash/features/game/components/explosion.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flutter/material.dart';

class ScoreDisplay extends TextComponent
    with
        HasGameReference<FlappyDashGame>,
        FlameBlocReader<GameCubit, GameState> {
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
    await super.onLoad();

    unawaited(_updateDisplayedScore());

    position = Vector2(0, -game.size.y / 2 + 100);
  }

  @override
  void update(double dt) {
    super.update(dt);

    _updateDisplayedScore();
  }

  Future<void> _updateDisplayedScore() async {
    final currentlyDisplayedScore = int.tryParse(text);
    final currentScore = switch (bloc.state) {
      PlayingState(:final score) => score,
      _ => null,
    };

    if (currentScore != null &&
        currentlyDisplayedScore != null &&
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

      text = ScoreFormatter.format(currentScore);
    } else {
      text = currentScore != null ? ScoreFormatter.format(currentScore) : '';
    }
  }
}
