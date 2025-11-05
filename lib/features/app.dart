import 'package:flame/game.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flappy_dash/features/overlays/game_over_overlay.dart';
import 'package:flappy_dash/features/overlays/main_menu_overlay.dart';
import 'package:flutter/material.dart';

class FlappyDashApp extends StatefulWidget {
  const FlappyDashApp({super.key});

  @override
  State<FlappyDashApp> createState() => _FlappyDashAppState();
}

class _FlappyDashAppState extends State<FlappyDashApp> {
  late final FlappyDashGame _game;

  GameScore? _score;

  @override
  void initState() {
    super.initState();

    _game = FlappyDashGame(
      onGameOver: (score) => setState(() {
        _score = score;
      }),
      onGameStarted: () => setState(() {
        _score = null;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            GameWidget(game: _game),
            if (_score case final score?)
              GameOverOverlay(
                score: score,
                onRestartTap: _game.start,
              )
            else if (!_game.started)
              MainMenuOverlay(
                onStartTap: _game.start,
              ),
          ],
        ),
      ),
    );
  }
}
