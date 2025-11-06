import 'package:flame/extensions.dart';
import 'package:flame_audio/flame_audio.dart';

enum GameSounds {
  jump1('jump_1.mp3'),
  jump2('jump_2.mp3'),
  jump3('jump_3.mp3'),
  crash('crash.mp3');

  const GameSounds(this.filename);

  final String filename;

  Future<void> play() async {
    await FlameAudio.play(filename);
  }

  static Future<void> playRandomJump() async {
    await FlameAudio.play(
      [jump1.filename, jump2.filename, jump3.filename].random(),
    );
  }
}
