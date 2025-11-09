import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flutter/painting.dart';

class Road extends PositionComponent
    with
        HasGameReference<FlappyDashGame>,
        FlameBlocListenable<GameCubit, GameState> {
  Road() : super(priority: 1);

  static const _velocityMultiplier = 25.0;
  static const _velocity = 8.5;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _positionAndSize();

    add(
      ParallaxComponent(
        parallax: Parallax(
          [
            ParallaxLayer(
              ParallaxImage(
                await game.images.load('road.jpg'),
                alignment: Alignment.bottomCenter,
                repeat: ImageRepeat.repeat,
              ),
              velocityMultiplier: Vector2(_velocityMultiplier, 0),
            ),
          ],
          baseVelocity: Vector2(_velocity, 0),
        ),
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

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
    final parallax = children
        .whereType<ParallaxComponent>()
        .firstOrNull
        ?.parallax;

    parallax?.baseVelocity = Vector2(animate ? _velocity : 0, 0);
    parallax?.layers.firstOrNull?.velocityMultiplier = Vector2(
      animate ? _velocityMultiplier : 0,
      0,
    );
  }

  void _positionAndSize() {
    size = Vector2(game.size.x * 5, 100);

    position = Vector2(
      -game.size.x / 2,
      game.size.y / 2 - size.y,
    );
  }
}
