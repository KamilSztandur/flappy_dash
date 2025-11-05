import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappy_dash/features/game/components/pipe.dart';
import 'package:flappy_dash/features/game/models/game_map.dart';
import 'package:flutter/material.dart';

class GameMapGenerator {
  const GameMapGenerator({
    required this.gameSize,
    this.totalPipes = 100,
  });

  final Vector2 gameSize;
  final int totalPipes;

  GameMap create() {
    final pipes = <Pipe>[];

    final random = Random();

    final maxHoleSize = gameSize.y * 0.6;

    for (var i = 0; i < totalPipes; i++) {
      final offset = 300.0 + i * 400.0;

      final decreasementFactor = Curves.easeOut.transform(
        (totalPipes - i) / totalPipes,
      );

      final holeSize = max(200, maxHoleSize * decreasementFactor).toDouble();

      final holePositionFactor = random.nextDouble();

      final remainingHeight = gameSize.y - holeSize;

      pipes.addAll([
        Pipe(
          globalOffset: offset,
          alignment: PipeAlignment.top,
          verticalOffset: remainingHeight * (1 - holePositionFactor) + 50,
        ),
        Pipe(
          globalOffset: offset,
          alignment: PipeAlignment.bottom,
          verticalOffset: remainingHeight * holePositionFactor - 50,
        ),
      ]);
    }

    return GameMap(pipes: pipes);
  }
}
