import 'package:flame_audio/flame_audio.dart';
import 'package:flappy_dash/features/app.dart';
import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flappy_dash/resources/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:window_manager/window_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  await WindowManager.instance.setFullScreen(true);

  await LeaderboardRepository.init();

  final prefs = await SharedPreferences.getInstance();

  await FlameAudio.bgm.audioPlayer.setVolume(0.1);

  runApp(
    GlobalProviders(
      preferences: prefs,
      child: const FlappyDashApp(),
    ),
  );
}
