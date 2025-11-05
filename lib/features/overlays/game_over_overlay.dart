import 'dart:math';

import 'package:flappy_dash/features/game/models/score.dart';
import 'package:flutter/material.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay({
    super.key,
    required this.score,
    required this.onRestartTap,
  });

  final GameScore score;
  final VoidCallback onRestartTap;

  static const _padding = EdgeInsetsDirectional.all(32);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    final itemsConstraints = BoxConstraints(
      maxWidth: min(screenSize.width - _padding.horizontal, 300),
    );

    return GestureDetector(
      onTap: onRestartTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ConstrainedBox(
            constraints: itemsConstraints,
            child: Text(
              'GAME OVER ${score.username}!',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.yellow,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: itemsConstraints,
            child: Text(
              'Your score was ${score.value}',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
