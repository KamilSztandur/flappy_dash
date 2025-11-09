import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/world.dart';
import 'package:flappy_dash/resources/game_music.dart';

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

      case GameOverState():
        unawaited(GameMusic.menu.play());
    }
  }

  @override
  void onRemove() {
    _gameStateSubscription?.cancel();

    super.onRemove();
  }
}
