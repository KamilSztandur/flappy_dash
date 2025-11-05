import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flutter/material.dart';

class ScoreListing extends StatelessWidget {
  const ScoreListing({
    super.key,
    required this.score,
    required this.place,
  });

  final GameScore score;
  final int place;

  static const firstPlaceColor = Colors.amber;
  static final secondPlaceColor = Colors.grey[400]!;
  static final thirdPlaceColor = Colors.brown[300]!;

  @override
  Widget build(BuildContext context) {
    final isTopThree = place < 4;

    final badgeColor = switch (place) {
      1 => firstPlaceColor,
      2 => secondPlaceColor,
      3 => thirdPlaceColor,
      _ => Colors.grey,
    };

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSpacings.s16.value),
        border: Border.all(color: isTopThree ? badgeColor : Colors.white),
        color: isTopThree
            ? badgeColor.withValues(alpha: 0.2)
            : Colors.transparent,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: isTopThree
              ? badgeColor
              : Colors.white.withValues(alpha: 0.2),
          child: isTopThree
              ? const Icon(
                  Icons.emoji_events,
                  color: Colors.white,
                )
              : Text(
                  '$place',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
        title: Text(
          score.username,
          style: TextStyle(
            color: isTopThree ? badgeColor : Colors.white,
            fontWeight: isTopThree ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: Text(
          '${score.value}',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
