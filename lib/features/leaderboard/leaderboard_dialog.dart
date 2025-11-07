import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flappy_dash/features/leaderboard/widgets/leaderboard_empty_view.dart';
import 'package:flappy_dash/features/leaderboard/widgets/leaderboard_view.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardDialog extends StatelessWidget {
  const LeaderboardDialog._();

  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (context) => const LeaderboardDialog._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    final repository = context.watch<LeaderboardRepository>();
    final scores = repository.getLeaderboard();

    const foregroundColor = Colors.white;
    const backgroundColor = Colors.white38;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppSpacings.s16.value),
          border: Border.all(color: foregroundColor),
        ),
        padding: AppSpacings.s16.horizontal + AppSpacings.s16.top,
        margin: AppSpacings.s24.all,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Text(
                  s.leaderboard_title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: foregroundColor,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    iconSize: AppSpacings.s24.value,
                    icon: const Icon(Icons.close),
                    color: foregroundColor,
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
              ],
            ),
            AppSpacings.s16.verticalSpace,
            const Divider(
              color: foregroundColor,
              height: 1,
              thickness: 1,
            ),
            Expanded(
              child: scores.isEmpty
                  ? const LeaderboardEmptyView()
                  : LeaderboardView(scores: scores),
            ),
          ],
        ),
      ),
    );
  }
}
