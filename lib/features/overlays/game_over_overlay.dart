import 'dart:math';

import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameOverOverlay extends StatelessWidget {
  const GameOverOverlay({super.key});

  static final _padding = AppSpacings.s32.all;

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    final gameCubit = context.watch<GameCubit>();
    final score = switch (gameCubit.state) {
      GameOverState(:final score) => score,
      _ => null,
    };

    final screenSize = MediaQuery.sizeOf(context);

    final itemsConstraints = BoxConstraints(
      maxWidth: min(screenSize.width - _padding.horizontal, 300),
    );

    return GestureDetector(
      onTap: () => gameCubit.startGame(screenSize: screenSize),
      behavior: HitTestBehavior.opaque,
      child: Column(
        spacing: AppSpacings.s16.value,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (score != null)
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
          if (score != null)
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
