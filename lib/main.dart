import 'package:flappy_dash/features/app.dart';
import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flappy_dash/resources/global_providers.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await LeaderboardRepository.init();

  runApp(const GlobalProviders(child: FlappyDashApp()));
}
