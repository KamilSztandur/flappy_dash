import 'package:flame/game.dart';
import 'package:flappy_dash/features/game/models/game_progress.dart';
import 'package:flappy_dash/features/game/world.dart';
import 'package:flutter/widgets.dart';

typedef GameOverCallback = void Function(int score);

class FlappyDashGame extends FlameGame with HasCollisionDetection {
  FlappyDashGame({
    required this.onGameOver,
    required this.onGameStarted,
  }) : super(world: FlappyDashWorld());

  final GameOverCallback onGameOver;
  final VoidCallback onGameStarted;

  final progress = GameProgress();

  void start() {
    world = FlappyDashWorld();
    progress.start();

    if (paused) {
      resumeEngine();
    }

    onGameStarted();
  }

  Future<void> gameOver() async {
    progress.gameOver();

    // Let's wait for engine to clean up after game before pausing it
    await Future<void>.delayed(const Duration(milliseconds: 100));

    pauseEngine();

    onGameOver(progress.score);
  }
}
