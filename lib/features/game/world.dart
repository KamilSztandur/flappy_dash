import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappy_dash/features/game/components/background.dart';
import 'package:flappy_dash/features/game/components/dash.dart';
import 'package:flappy_dash/features/game/components/road.dart';
import 'package:flappy_dash/features/game/components/score_display.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flappy_dash/features/game/providers/game_providers.dart';

class GameWorld extends World
    with TapCallbacks, HasGameReference<FlappyDashGame> {
  GameWorld({required this.gameCubit});

  final GameCubit gameCubit;
  StreamSubscription<GameState>? _gameStateSubscription;

  Dash? player;
  ScoreDisplay? scoreDisplay;

  static final _gameElementsKey = ComponentKey.unique();
  static final _gameBackgroundKey = ComponentKey.unique();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    _gameStateSubscription = gameCubit.stream.listen(_gameListener);

    add(
      GameProviders(
        key: _gameBackgroundKey,
        gameCubit: gameCubit,
        components: [
          CityBackground(),
          Road(),
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    super.update(dt);

    gameCubit.updateScore();
  }

  void _gameListener(GameState state) {
    switch (state) {
      case MainMenuGameState():
        _maybeRemoveComponent(_gameElementsKey);

      case PlayingState():
        break;

      case StartedPlayingState(:final map):
        _maybeRemoveComponent(_gameElementsKey);

        player = Dash();
        scoreDisplay = ScoreDisplay();

        add(
          GameProviders(
            key: _gameElementsKey,
            gameCubit: gameCubit,
            components: [
              ...map.pipes,
              ?player,
              ?scoreDisplay,
            ],
          ),
        );

        player?.jump();

      case GameOverState():
        _maybeRemoveComponent(ScoreDisplay.scoreKey);
    }
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    player?.jump();
  }

  @override
  void onRemove() {
    _gameStateSubscription?.cancel();

    super.onRemove();
  }

  void _maybeRemoveComponent(ComponentKey key) {
    try {
      final component = game.findByKey(key);

      if (component != null) {
        remove(component);
      }
    } catch (_) {
      // Ignore it
    }
  }
}
