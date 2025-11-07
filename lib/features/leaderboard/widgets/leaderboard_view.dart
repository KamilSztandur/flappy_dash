import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flappy_dash/features/leaderboard/widgets/score_listing.dart';
import 'package:flutter/material.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({
    super.key,
    required this.scores,
  });

  final List<GameScore> scores;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: AppSpacings.s24.vertical,
      itemCount: scores.length,
      separatorBuilder: (context, index) => AppSpacings.s16.verticalSpace,
      itemBuilder: (context, index) => ScoreListing(
        score: scores[index],
        place: index + 1,
      ),
    );
  }
}
