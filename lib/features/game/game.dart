import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/models/game_music.dart';
import 'package:flappy_dash/features/game/world.dart';

class FlappyDashGame extends FlameGame with HasCollisionDetection {
  FlappyDashGame({required this.gameCubit});

  final GameCubit gameCubit;

  StreamSubscription<GameState>? _gameStateSubscription;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    unawaited(GameMusic.menu.play());

    gameCubit.stream.listen(_onGameStateChanged);

    world = GameWorld(gameCubit: gameCubit);
  }

  Future<void> _onGameStateChanged(GameState state) async {
    switch (state) {
      case MainMenuGameState():
        unawaited(GameMusic.menu.play());

      case PlayingState():
        break;

      case StartedPlayingState():
        unawaited(GameMusic.game.play());

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

  @override
  void onRemove() {
    _gameStateSubscription?.cancel();

    super.onRemove();
  }
}
