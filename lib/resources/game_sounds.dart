import 'package:flame/extensions.dart';
import 'package:flame_audio/flame_audio.dart';

enum GameSounds {
  jump1('jump_1.mp3'),
  jump2('jump_2.mp3'),
  jump3('jump_3.mp3'),
  crash('crash.mp3');

  const GameSounds(this.filename);

  final String filename;

  static const _maxRetries = 5;
  static const _retryDelay = Duration(milliseconds: 100);

  Future<void> play() async {
    try {
      await FlameAudio.play(filename);
    } catch (_) {
      for (var i = 0; i < _maxRetries; i++) {
        await Future<void>.delayed(_retryDelay);

        try {
          await FlameAudio.play(filename);

          return;
        } catch (_) {
          continue;
        }
      }
    }
  }

  static Future<void> playRandomJump() async {
    await [jump1, jump2, jump3].random().play();
  }
}
