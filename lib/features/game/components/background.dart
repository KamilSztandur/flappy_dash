import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame/rendering.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flutter/material.dart';

class Background extends ParallaxComponent<FlappyDashGame>
    with FlameBlocReader<GameCubit, GameState> {
  Background();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final isGameOngoing = bloc.state is! GameOverState;

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

  @override
  void update(double dt) {
    super.update(dt);

    position = Vector2(
      -game.size.x / 2,
      -game.size.y / 2,
    );

    size = game.size;
  }
}
