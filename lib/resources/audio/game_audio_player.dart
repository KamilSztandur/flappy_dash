import 'package:flappy_dash/resources/audio/game_music.dart';
import 'package:flappy_dash/resources/audio/game_sounds.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

class GameAudioPlayer {
  GameAudioPlayer._();

  static final GameAudioPlayer instance = GameAudioPlayer._();

  Future<void> init() async {
    await _soloud.init();

    for (final sound in GameSounds.values) {
      final source = await _soloud.loadAsset(sound.path);
      _soundSources[sound] = source;
    }

    for (final music in GameMusic.values) {
      final source = await _soloud.loadAsset(music.path);
      _musicSources[music] = source;
    }
  }

  Future<void> dispose() async {
    await stopCurrentMusic();

    for (final source in _soundSources.values) {
      await _soloud.disposeSource(source);
    }

    for (final source in _musicSources.values) {
      await _soloud.disposeSource(source);
    }

    _soloud.deinit();
  }

  final _soloud = SoLoud.instance;

  final _soundSources = <GameSounds, AudioSource>{};
  final _musicSources = <GameMusic, AudioSource>{};

  SoundHandle? _currentMusicHandle;

  Future<void> playMusic(GameMusic music) async {
    try {
      await stopCurrentMusic();

      final source = _musicSources[music];
      if (source == null) {
        return;
      }

      _currentMusicHandle = await _soloud.play(
        source,
        looping: true,
      );
    } catch (_) {
      // Handle error silently or log if needed
    }
  }

  Future<void> stopCurrentMusic() async {
    if (_currentMusicHandle case final currentMusicHandle?) {
      await _soloud.stop(currentMusicHandle);
      _currentMusicHandle = null;
    }
  }

  Future<void> playSound(GameSounds sound) async {
    try {
      final source = _soundSources[sound];
      if (source == null) {
        return;
      }

      await _soloud.play(source, volume: 0.7);
    } catch (_) {
      // Handle error silently or log if needed
    }
  }
}
