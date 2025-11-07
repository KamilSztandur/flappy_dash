import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flappy_dash/features/leaderboard/widgets/leaderboard_empty_view.dart';
import 'package:flappy_dash/features/leaderboard/widgets/leaderboard_view.dart';
import 'package:flappy_dash/resources/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardRoute extends MaterialPageRoute<void> {
  LeaderboardRoute() : super(builder: (context) => const LeaderboardScreen());
}

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final s = l10n(context);

    final repository = context.watch<LeaderboardRepository>();
    final scores = repository.getLeaderboard();

    return Scaffold(
      appBar: AppBar(
        title: Text(s.leaderboard_title),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.deepPurple,
      body: scores.isEmpty
          ? const LeaderboardEmptyView()
          : LeaderboardView(scores: scores),
    );
  }
}
