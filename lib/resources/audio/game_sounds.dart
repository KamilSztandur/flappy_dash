import 'package:flame/extensions.dart';

enum GameSounds {
  jump1('assets/audio/jump_1.mp3'),
  jump2('assets/audio/jump_2.mp3'),
  jump3('assets/audio/jump_3.mp3'),
  crash('assets/audio/crash.mp3'),
  tip('assets/audio/flutter_tip.mp3');

  const GameSounds(this.path);

  final String path;

  static GameSounds get randomJump => [jump1, jump2, jump3].random();
}
