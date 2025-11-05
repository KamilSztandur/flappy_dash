import 'package:flame/game.dart';
import 'package:flappy_dash/features/game/models/score.dart';
import 'package:flappy_dash/features/game/world.dart';
import 'package:flutter/widgets.dart';

typedef GameOverCallback = void Function(GameScore score);

class FlappyDashGame extends FlameGame with HasCollisionDetection {
  FlappyDashGame({
    required this.onGameOver,
    required this.onGameStarted,
  }) : super(world: FlappyDashWorld());

  final GameOverCallback onGameOver;
  final VoidCallback onGameStarted;
  final double horizontalSpeed = 0.3; // pixels per millisecond

  DateTime? _startTime;
  bool _isGameOver = false;

  bool get started => _startTime != null;
  bool get isGameOver => _isGameOver;

  double get horizontalOffset => switch (_startTime) {
    final startTime? =>
      startTime.difference(DateTime.now()).inMilliseconds * horizontalSpeed,
    null => 0,
  };

  void start() {
    _startTime = DateTime.now();
    _isGameOver = false;

    resumeEngine();

    world = FlappyDashWorld();

    onGameStarted();
  }

  void gameOver() {
    _startTime = null;
    _isGameOver = true;

    pauseEngine();

    onGameOver(
      // TODO: Use real score
      const GameScore(
        value: 2137,
        username: 'Nelik',
      ),
    );
  }
}
