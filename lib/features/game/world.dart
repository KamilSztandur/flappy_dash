import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/components/background.dart';
import 'package:flappy_dash/features/game/components/ground.dart';
import 'package:flappy_dash/features/game/components/player.dart';
import 'package:flappy_dash/features/game/components/score_display.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/game.dart';

class FlappyDashWorld extends World
    with
        TapCallbacks,
        HasGameReference<FlappyDashGame>,
        FlameBlocListenable<GameCubit, GameState>,
        FlameBlocReader<GameCubit, GameState> {
  FlappyDashWorld();

  final player = Player();
  final scoreDisplay = ScoreDisplay();

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    add(Background());
    add(Ground());
  }

  @override
  void onNewState(GameState state) {
    super.onNewState(state);

    switch (state) {
      case MainMenuGameState():
        _maybeRemoveComponent(scoreDisplay, ScoreDisplay.scoreKey);
        _maybeRemoveComponent(player, Player.playerKey);

      case PlayingState(:final map):
        map.pipes.forEach(add);
        add(player);
        add(scoreDisplay);

        player.jump();

      case GameOverState():
        _maybeRemoveComponent(scoreDisplay, ScoreDisplay.scoreKey);
    }
  }

  @override
  void update(double dt) {
    super.update(dt);

    bloc.updateScore();
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    player.jump();
  }

  void _maybeRemoveComponent(Component component, ComponentKey key) {
    if (game.findByKey(key) != null) {
      remove(component);
    }
  }
}
