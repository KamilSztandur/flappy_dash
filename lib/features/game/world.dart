import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappy_dash/features/game/components/background.dart';
import 'package:flappy_dash/features/game/components/ground.dart';
import 'package:flappy_dash/features/game/components/pipe.dart';
import 'package:flappy_dash/features/game/components/player.dart';
import 'package:flappy_dash/features/game/engine/game_map_generator.dart';
import 'package:flappy_dash/features/game/game.dart';

class FlappyDashWorld extends World
    with TapCallbacks, HasGameReference<FlappyDashGame> {
  FlappyDashWorld();

  final player = Player();

  @override
  Future<void> onLoad() async {
    add(Background());

    add(Ground());

    final gameMap = GameMapGenerator(gameSize: game.size).create();
    gameMap.pipes.forEach(add);
  }

  @override
  Future<void> update(double dt) async {
    if (game.started && game.findByKey(Player.playerKey) == null) {
      add(player);
    }

    super.update(dt);
  }

  @override
  void onTapDown(TapDownEvent event) {
    player.jump();

    super.onTapDown(event);
  }
}
