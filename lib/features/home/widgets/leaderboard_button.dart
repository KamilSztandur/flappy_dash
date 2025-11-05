import 'package:flappy_dash/features/leaderboard/leaderboard_page.dart';
import 'package:flutter/material.dart';

class LeaderboardButton extends StatelessWidget {
  const LeaderboardButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: #leaderboard_button,
      onPressed: () => Navigator.of(context).push(LeaderboardRoute()),
      backgroundColor: Colors.white30,
      foregroundColor: Colors.white,
      child: const Icon(Icons.leaderboard),
    );
  }
}
