import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';

class LeaderboardEmptyView extends StatelessWidget {
  const LeaderboardEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    return Center(
      child: Padding(
        padding: AppSpacings.s32.all,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_events_outlined,
              size: 64,
              color: Colors.yellow,
            ),
            const SizedBox(height: 16),
            Text(
              s.leaderboard_empty_title,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.yellow,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              s.leaderboard_empty_subtitle,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
