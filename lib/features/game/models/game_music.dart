import 'package:flame_audio/flame_audio.dart';

enum GameMusic {
  menu('menu_music.mp3'),
  game('game_music.mp3');

  const GameMusic(this.filename);

  final String filename;

  Future<void> play() async {
    await FlameAudio.bgm.stop();
    await FlameAudio.bgm.play(filename);
  }
}
