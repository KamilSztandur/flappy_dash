import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame/rendering.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flappy_dash/resources/display/game_sprites.dart';
import 'package:flutter/material.dart';

class CityBackground extends ParallaxComponent<FlappyDashGame>
    with FlameBlocListenable<GameCubit, GameState> {
  CityBackground() : super(priority: 0);

  static const _velocityMultiplier = 15.0;
  static const _velocity = 5.0;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    final sky = ParallaxLayer(
      ParallaxImage(
        await game.images.load(GameSprites.city.filename),
        repeat: ImageRepeat.repeatX,
      ),
      velocityMultiplier: Vector2(_velocityMultiplier, 0),
    );

    parallax = Parallax(
      [sky],
      baseVelocity: Vector2(_velocity, 0),
    );

    decorator
      ..addLast(PaintDecorator.blur(3.5))
      ..addLast(
        PaintDecorator.tint(const Color(0xFF000000).withValues(alpha: 0.15)),
      );

    position = Vector2(
      -game.size.x / 2,
      -game.size.y / 2,
    );

    size = game.size;
  }

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    _positionAndSize();
  }

  @override
  void onNewState(GameState state) {
    super.onNewState(state);

    switch (state) {
      case StartedPlayingState(:final isRestart) when isRestart:
        _toggleParalax(true);

      case GameOverState():
        _toggleParalax(false);

      default:
      // Do nothing
    }
  }

  void _toggleParalax(bool animate) {
    parallax?.baseVelocity = Vector2(animate ? _velocity : 0, 0);
    parallax?.layers.firstOrNull?.velocityMultiplier = Vector2(
      animate ? _velocityMultiplier : 0,
      0,
    );
  }

  void _positionAndSize() {
    position = Vector2(
      -game.size.x / 2,
      -game.size.y / 2,
    );

    size = game.size;
  }
}
