import 'dart:math';

import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay({
    super.key,
    required this.score,
    required this.onRestartTap,
  });

  final GameScore score;
  final VoidCallback onRestartTap;

  static final _padding = AppSpacings.s32.all;

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

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
              s.game_over_title(score.username).toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: Colors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          AppSpacings.s16.verticalSpace,
          ConstrainedBox(
            constraints: itemsConstraints,
            child: Text(
              s.game_over_message(score.value),
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
