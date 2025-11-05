import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappy_dash/features/game/components/background.dart';
import 'package:flappy_dash/features/game/components/ground.dart';
import 'package:flappy_dash/features/game/components/player.dart';
import 'package:flappy_dash/features/game/components/score_display.dart';
import 'package:flappy_dash/features/game/engine/game_map_generator.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flappy_dash/features/game/models/game_map.dart';
import 'package:flappy_dash/features/game/models/game_stage.dart';

class FlappyDashWorld extends World
    with TapCallbacks, HasGameReference<FlappyDashGame> {
  FlappyDashWorld();

  final player = Player();
  final scoreDisplay = ScoreDisplay();
  late final GameMap gameMap;

  @override
  Future<void> onLoad() async {
    gameMap = GameMapGenerator(gameSize: game.size).create();

    add(Background());

    add(Ground());

    gameMap.pipes.forEach(add);
  }

  @override
  Future<void> update(double dt) async {
    if (game.progress.stage == GameStage.game &&
        game.findByKey(Player.playerKey) == null) {
      add(player);
      add(scoreDisplay);
    }

    if (game.progress.stage == GameStage.gameOver &&
        game.findByKey(ScoreDisplay.scoreKey) != null) {
      remove(scoreDisplay);
    }

    game.progress.updateScore(gameMap.scoreMilestones);

    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    player.jump();

    super.onTapDown(event);
  }
}
