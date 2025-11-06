import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/models/game_music.dart';
import 'package:flappy_dash/features/game/world.dart';

class FlappyDashGame extends FlameGame
    with FlameBlocListenable<GameCubit, GameState> {
  FlappyDashGame() : super(world: FlappyDashWorld());

  @override
  Future<void> onNewState(GameState state) async {
    super.onNewState(state);

    switch (state) {
      case MainMenuGameState():
        unawaited(GameMusic.menu.play());

      case PlayingState(:final wasRestarted):
        unawaited(GameMusic.game.play());

        if (wasRestarted) {
          world = FlappyDashWorld();
        }

        if (paused) {
          resumeEngine();
        }

      case GameOverState():
        unawaited(GameMusic.menu.play());

        // Let's wait for engine to play music and then clean up after game
        // before pausing it
        await Future<void>.delayed(const Duration(milliseconds: 100));

        pauseEngine();
    }
  }
}
