import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flutter/painting.dart';

class Ground extends ParallaxComponent<FlappyDashGame>
    with FlameBlocReader<GameCubit, GameState> {
  Ground();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await _toggleParalax(toggled: false);

    position = Vector2(-game.size.x / 2, -game.size.y / 4);
  }

  @override
  Future<void> update(double dt) async {
    super.update(dt);

    final isGameOngoing = bloc.state is! GameOverState;

    final isParalaxToggled = parallax?.baseVelocity.x != 0;

    if (isGameOngoing && !isParalaxToggled) {
      await _toggleParalax(toggled: true);
    }

    position = Vector2(-game.size.x / 2, -game.size.y / 4);
  }

  Future<void> _toggleParalax({required bool toggled}) async {
    final sky = ParallaxLayer(
      ParallaxImage(
        await game.images.load('grass.png'),
        repeat: ImageRepeat.repeatX,
      ),
      velocityMultiplier: Vector2(toggled ? 15 : 0, 0),
    );

    parallax = Parallax(
      [sky],
      baseVelocity: Vector2(toggled ? 5 : 0, 0),
    );
  }
}
