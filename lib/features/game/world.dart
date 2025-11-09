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

    print('xcf ${gameProvider.children.length}');

    gameCubit.updateScore();
  }

  void _gameListener(GameState state) {
    switch (state) {
      case MainMenuGameState():
      case PlayingState():
        break;

      case StartedPlayingState(:final isRestart):
        print('isRestart: $isRestart');
        if (isRestart) {
          _tearDownGameElements();
          _setupGameElements(state);
        } else {
          _setupGameElements(state);
        }

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

  void _setupGameElements(StartedPlayingState state) {
    final player = Dash();

    gameProvider.addAll([
      ...state.map.pipes,
      Dash(),
      ScoreDisplay(),
    ]);

    player.jump();
  }

  void _tearDownGameElements() {
    gameProvider.removeWhere(
      (component) => component is! CityBackground && component is! Road,
    );
  }
}
