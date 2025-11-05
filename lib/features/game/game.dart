import 'dart:async';

import 'package:flame/game.dart';
import 'package:flame_audio/flame_audio.dart';
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

  Future<void> init() async {
    await FlameAudio.bgm.audioPlayer.setVolume(0.1);
    await FlameAudio.bgm.play('menu_music.mp3');
  }

  Future<void> start() async {
    await FlameAudio.bgm.stop();
    unawaited(FlameAudio.bgm.play('game_music.mp3'));

    world = FlappyDashWorld();
    progress.start();

    if (paused) {
      resumeEngine();
    }

    onGameStarted();
  }

  Future<void> gameOver() async {
    await FlameAudio.bgm.stop();
    unawaited(FlameAudio.bgm.play('menu_music.mp3'));
    unawaited(FlameAudio.play('game_over.mp3'));

    progress.gameOver();

    // Let's wait for engine to clean up after game before pausing it
    await Future<void>.delayed(const Duration(milliseconds: 100));

    pauseEngine();

    onGameOver(progress.score);
  }
}
