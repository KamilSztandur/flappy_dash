import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappy_dash/features/game/components/background.dart';
import 'package:flappy_dash/features/game/components/dash.dart';
import 'package:flappy_dash/features/game/components/road.dart';
import 'package:flappy_dash/features/game/components/score_display.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flappy_dash/features/game/providers/game_provider.dart';
import 'package:flappy_dash/features/game/utils/game_map_generator.dart';

class GameWorld extends World
    with TapCallbacks, HasGameReference<FlappyDashGame> {
  GameWorld({required this.gameCubit})
    : gameProvider = GameProvider(
        gameCubit: gameCubit,
        children: [
          CityBackground(),
          Road(),
        ],
      );

  final GameProvider gameProvider;
  final GameCubit gameCubit;
  StreamSubscription<GameState>? _gameStateSubscription;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(gameProvider);

    _gameStateSubscription = gameCubit.stream.listen(_gameListener);
  }

  @override
  void update(double dt) {
    super.update(dt);

    gameCubit.updateScore();

    if (gameCubit.state
        case PlayingState(:final map) || StartedPlayingState(:final map)) {
      GameMapGenerator.updateRenderedObstacles(
        gameProvider,
        screenSize: game.size,
        obstacles: map.obstacles,
        distanceTravelled: gameCubit.state.calculateDistanceTravelled(),
      );
    }
  }

  void _gameListener(GameState state) {
    switch (state) {
      case MainMenuGameState():
      case PlayingState():
        break;

      case StartedPlayingState(:final isRestart):
        if (isRestart) {
          gameProvider.removeWhere(
            (component) => component is! CityBackground && component is! Road,
          );
        }

        final player = Dash();

        gameProvider.addAll([
          Dash(),
          ScoreDisplay(),
        ]);

        player.jump();

      case GameOverState():
        final component = game.findByKey(ScoreDisplay.scoreKey);
        if (component != null) {
          gameProvider.remove(component);
        }
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    gameProvider.children.whereType<Dash>().firstOrNull?.jump();
  }

  @override
  void onRemove() {
    _gameStateSubscription?.cancel();

    super.onRemove();
  }
}
