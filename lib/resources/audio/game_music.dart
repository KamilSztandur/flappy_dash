enum GameMusic {
  menu('assets/audio/menu_music.mp3'),
  game('assets/audio/gameplay_music.mp3');

  const GameMusic(this.path);

  final String path;
}
