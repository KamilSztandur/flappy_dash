import 'dart:math';

import 'package:flappy_dash/features/game/components/obstacle.dart';
import 'package:flappy_dash/features/game/models/game_map.dart';
import 'package:flutter/material.dart';

class GameMapGenerator {
  const GameMapGenerator({
    required this.screenHeight,
    this.totalPipes = 100,
  });

  final double screenHeight;
  final int totalPipes;

  static const _minHoleSize = 150.0;

  static const _decreasementCount = 30;

  GameMap create() {
    final pipes = <Obstacle>[];

    final random = Random();

    final maxHoleSize = min(300, screenHeight * 0.8);

    for (var i = 0; i < totalPipes; i++) {
      final offset = 600.0 + i * 600.0;

      final decreasementFactor = Curves.easeOut.transform(
        max(0, _decreasementCount - i) / _decreasementCount,
      );

      final holeSize = max(_minHoleSize, maxHoleSize * decreasementFactor);

      final holePositionFactor = random.nextDouble();

      final remainingHeight = screenHeight - holeSize;

      pipes.addAll([
        Obstacle(
          globalOffset: offset,
          alignment: ObstacleAlignment.top,
          verticalOffset: remainingHeight * (1 - holePositionFactor) + 50,
        ),
        Obstacle(
          globalOffset: offset,
          alignment: ObstacleAlignment.bottom,
          verticalOffset: remainingHeight * holePositionFactor - 50,
        ),
      ]);
    }

    return GameMap(
      pipes: pipes,
      scoreMilestones: {
        for (final pipe in pipes) pipe.globalOffset,
      },
    );
  }
}
