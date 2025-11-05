import 'package:flappy_dash/features/game/models/game_stage.dart';

class GameProgress {
  GameProgress();

  GameStage stage = GameStage.mainMenu;
  DateTime? _startTime;
  int _score = 0;

  static const _horizontalSpeed = 0.3; // pixels per millisecond

  double get horizontalOffset => switch (_startTime) {
    final startTime? =>
      startTime.difference(DateTime.now()).inMilliseconds.abs() *
          _horizontalSpeed,
    null => 0,
  };

  int get score => _score;

  void updateScore(Set<double> scoreMilestones) {
    if (stage != GameStage.game) {
      return;
    }

    var reachedScoreMilestones = 0;

    final distanceTraveled = horizontalOffset;

    for (final milestone in scoreMilestones) {
      if (distanceTraveled >= milestone) {
        reachedScoreMilestones++;
      }
    }

    _score = reachedScoreMilestones;
  }

  void start() {
    _score = 0;
    _startTime = DateTime.now();
    stage = GameStage.game;
  }

  void gameOver() {
    stage = GameStage.gameOver;
  }
}
