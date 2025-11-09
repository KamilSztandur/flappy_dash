import 'dart:ui';

import 'package:flappy_dash/features/app.dart';
import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flappy_dash/resources/global_providers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    debugPrint('FlutterError: ${details.exceptionAsString()}');
    debugPrint('${details.stack}');
  };

  PlatformDispatcher.instance.onError = (err, st) {
    debugPrint('PlatformDispatcherError: $err');
    debugPrint('$st');
    return true;
  };

  await LeaderboardRepository.init();

  final prefs = await SharedPreferences.getInstance();

  runApp(
    GlobalProviders(
      preferences: prefs,
      child: const FlappyDashApp(),
    ),
  );
}
