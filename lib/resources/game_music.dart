import 'package:flame_audio/flame_audio.dart';

enum GameMusic {
  menu('menu_music.mp3'),
  game('game_music.mp3');

  const GameMusic(this.filename);

  final String filename;

  static const _maxRetries = 100;
  static const _retryDelay = Duration(milliseconds: 100);

  Future<void> play() async {
    try {
      await FlameAudio.bgm.stop();
      await FlameAudio.bgm.play(filename);
    } catch (_) {
      for (var i = 0; i < _maxRetries; i++) {
        await Future<void>.delayed(_retryDelay);

        try {
          await FlameAudio.bgm.stop();
          await FlameAudio.bgm.play(filename);

          return;
        } catch (_) {
          continue;
        }
      }
    }
  }
}
