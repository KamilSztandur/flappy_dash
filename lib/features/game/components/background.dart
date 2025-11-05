import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame/rendering.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flappy_dash/features/game/models/game_stage.dart';
import 'package:flutter/material.dart';

class Background extends ParallaxComponent<FlappyDashGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final isGameOngoing = game.progress.stage == GameStage.game && !game.paused;

    final sky = ParallaxLayer(
      ParallaxImage(
        await game.images.load('sky.webp'),
        repeat: ImageRepeat.repeatX,
      ),
      velocityMultiplier: Vector2(isGameOngoing ? 15 : 0, 0),
    );

    decorator
      ..addLast(PaintDecorator.blur(5.5))
      ..addLast(
        PaintDecorator.tint(const Color(0xFF000000).withValues(alpha: 0.15)),
      );

    parallax = Parallax(
      [sky],
      baseVelocity: Vector2(isGameOngoing ? 5 : 0, 0),
    );

    position = Vector2(
      -game.size.x / 2,
      -game.size.y / 2,
    );

    size = game.size;
  }
}
