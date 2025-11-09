import 'dart:async';

import 'package:flame/game.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/world.dart';
import 'package:flappy_dash/resources/game_assets.dart';
import 'package:flappy_dash/resources/game_display_mode_provider.dart';
import 'package:flappy_dash/resources/game_music.dart';
import 'package:flutter/widgets.dart';

class FlappyDashGame extends FlameGame with HasCollisionDetection {
  FlappyDashGame({
    required this.gameCubit,
    required this.onEngineLoaded,
  });

  final GameCubit gameCubit;
  final VoidCallback onEngineLoaded;

  StreamSubscription<GameState>? _gameStateSubscription;

  @override
  void onGameResize(Vector2 size) {
    super.onGameResize(size);

    GameDisplayModeProvider.instance.update(size);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await _preloadAssets();

    unawaited(GameMusic.menu.play());

    gameCubit.stream.listen(_onGameStateChanged);

    world = GameWorld(gameCubit: gameCubit);

    onEngineLoaded();
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

  Future<void> _preloadAssets() async {
    await [
      for (final asset in GameAssets.values) images.load(asset.filename),
    ].wait;
  }
}
