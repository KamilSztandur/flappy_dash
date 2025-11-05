import 'package:flame/game.dart';
import 'package:flappy_dash/design_system/language/switch_language_button.dart';
import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flappy_dash/features/game/models/game_stage.dart';
import 'package:flappy_dash/features/leaderboard/leaderboard_page.dart';
import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flappy_dash/features/overlays/game_over_overlay.dart';
import 'package:flappy_dash/features/overlays/main_menu_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FlappyDashGame _game;
  GameScore? _lastScore;
  var _hideUI = false;

  @override
  void initState() {
    super.initState();

    _game = FlappyDashGame(
      onGameOver: (score) {
        context.read<LeaderboardRepository>().writeScore(score);

        setState(() {
          _hideUI = false;

          _lastScore = score;
        });
      },
      onGameStarted: () => setState(() {
        _hideUI = true;
        _lastScore = null;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _hideUI
          ? null
          : Column(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSpacings.s16.value,
              children: [
                const SwitchLanguageButton(),
                FloatingActionButton(
                  heroTag: #leaderboard_button,
                  onPressed: () =>
                      Navigator.of(context).push(LeaderboardRoute()),
                  backgroundColor: Colors.white30,
                  foregroundColor: Colors.white,
                  child: const Icon(Icons.leaderboard),
                ),
              ],
            ),
      body: Stack(
        children: [
          GameWidget(game: _game),
          if (!_hideUI)
            switch (_game.progress.stage) {
              GameStage.gameOver => GameOverOverlay(
                score: _lastScore!,
                onRestartTap: _game.start,
              ),
              GameStage.mainMenu => MainMenuOverlay(
                onStartTap: _game.start,
              ),
              GameStage.game => const SizedBox.shrink(),
            },
        ],
      ),
    );
  }
}
