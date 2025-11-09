import 'dart:math';

import 'package:flame/game.dart';
import 'package:flappy_dash/features/game/components/obstacle.dart';
import 'package:flappy_dash/features/game/models/game_map.dart';
import 'package:flappy_dash/features/game/providers/game_provider.dart';
import 'package:flutter/material.dart';

class GameMapGenerator {
  const GameMapGenerator({
    required this.screenSize,
    this.totalObstacles = 10000,
  });

  final Size screenSize;
  final int totalObstacles;

  static const _minHoleSize = 150.0;

  static const _decreasementCount = 30;

  GameMap create() {
    final obstacles = <Obstacle>[];

    final random = Random();

    final maxHoleSize = min(300, screenSize.height * 0.8);

    final initialOffset = screenSize.width / 2 + 100;

    for (var i = 0; i < totalObstacles; i++) {
      final offset = initialOffset + i * 600.0;

      final decreasementFactor = Curves.easeOut.transform(
        max(0, _decreasementCount - i) / _decreasementCount,
      );

      final holeSize = max(_minHoleSize, maxHoleSize * decreasementFactor);

      final holePositionFactor = random.nextDouble();

      final remainingHeight = screenSize.height - holeSize;

      obstacles.addAll([
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
      obstacles: obstacles,
      scoreMilestones: {
        for (final obstacle in obstacles) obstacle.globalOffset,
      },
    );
  }

  static void updateRenderedObstacles(
    GameProvider game, {
    required Vector2 screenSize,
    required List<Obstacle> obstacles,
    required double distanceTravelled,
  }) {
    final screenWidth = screenSize.x;

    for (final component in game.children) {
      if (component case Obstacle(
        :final globalOffset,
      ) when globalOffset < distanceTravelled - screenWidth * (2 / 3)) {
        game.remove(component);
      }
    }

    for (final obstacle in obstacles) {
      if (obstacle.globalOffset < distanceTravelled + screenWidth * (2 / 3)) {
        game.add(obstacle);
      }
    }
  }
}
