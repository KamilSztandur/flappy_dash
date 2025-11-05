import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flappy_dash/features/game/components/background.dart';
import 'package:flappy_dash/features/game/components/ground.dart';
import 'package:flappy_dash/features/game/components/pipe.dart';
import 'package:flappy_dash/features/game/components/player.dart';
import 'package:flappy_dash/features/game/game.dart';

class FlappyDashWorld extends World
    with TapCallbacks, HasGameReference<FlappyDashGame> {
  FlappyDashWorld();

  final player = Player();

  @override
  Future<void> onLoad() async {
    add(Background());

    add(Ground());

    const totalPipes = 10;
    for (var i = 0; i < totalPipes; i++) {
      final offset = 300.0 + i * 400.0;
      final holeSize = (totalPipes - i) * 30.0;

      final holePositionFactor = Random().nextDouble();

      final remainingHeight = game.size.y - holeSize;

      final bottomPipeOffset = remainingHeight * holePositionFactor;
      final topPipeOffset = remainingHeight * (1 - holePositionFactor);

      add(
        Pipe(
          horizontalOffset: offset,
          alignment: PipeAlignment.top,

          verticalOffset: topPipeOffset,
        ),
      );

      add(
        Pipe(
          horizontalOffset: offset,
          alignment: PipeAlignment.bottom,
          verticalOffset: bottomPipeOffset,
        ),
      );
    }
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
