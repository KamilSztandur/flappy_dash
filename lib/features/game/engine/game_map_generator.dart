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

  static const _minHoleSize = 150.0;

  static const _decreasementCount = 30;

  GameMap create() {
    final pipes = <Pipe>[];

    final random = Random();

    final maxHoleSize = min(300, gameSize.y * 0.8);

    for (var i = 0; i < totalPipes; i++) {
      final offset = 600.0 + i * 600.0;

      final decreasementFactor = Curves.easeOut.transform(
        max(0, _decreasementCount - i) / _decreasementCount,
      );

      final holeSize = max(_minHoleSize, maxHoleSize * decreasementFactor);

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

    return GameMap(
      pipes: pipes,
      scoreMilestones: {
        for (final pipe in pipes) pipe.globalOffset,
      },
    );
  }
}
