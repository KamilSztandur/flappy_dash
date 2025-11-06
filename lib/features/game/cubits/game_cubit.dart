import 'package:equatable/equatable.dart';
import 'package:flappy_dash/common/shared_preferences.dart';
import 'package:flappy_dash/features/game/models/game_map.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flappy_dash/features/game/utils/game_map_generator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit({required AppSharedPreferences preferences})
    : _preferences = preferences,
      super(const MainMenuGameState());

  final AppSharedPreferences _preferences;

  void startGame({required double screenHeight}) {
    if (state is PlayingState || state is StartedPlayingState) {
      return;
    }

    emit(
      StartedPlayingState(
        startTime: DateTime.now(),
        map: GameMapGenerator(screenHeight: screenHeight).create(),
      ),
    );
  }

  void updateScore() {
    if (state
        case PlayingState(:final map, :final startTime) ||
            StartedPlayingState(:final map, :final startTime)) {
      var reachedMilestones = 0;

      final distanceTraveled = state.calculateDistanceTravelled();

      for (final milestone in map.scoreMilestones) {
        if (distanceTraveled >= milestone) {
          reachedMilestones++;
        }
      }

      emit(
        PlayingState(
          startTime: startTime,
          map: map,
          score: reachedMilestones,
        ),
      );
    }
  }

  void gameOver() {
    if (state case PlayingState(:final score, :final startTime)) {
      emit(
        GameOverState(
          startTime: startTime,
          score: GameScore(
            username: _preferences.username,
            value: score,
          ),
        ),
      );
    }
  }
}

sealed class GameState with EquatableMixin {
  const GameState();

  static const _gameHorizontalSpeed = 0.3; // pixels per millisecond

  double calculateDistanceTravelled() => switch (this) {
    StartedPlayingState(:final startTime) ||
    PlayingState(:final startTime) ||
    GameOverState(:final startTime) =>
      startTime.difference(DateTime.now()).inMilliseconds.abs() *
          _gameHorizontalSpeed,
    _ => 0,
  };
}

class MainMenuGameState extends GameState {
  const MainMenuGameState();

  @override
  List<Object?> get props => [];
}

class StartedPlayingState extends GameState {
  const StartedPlayingState({
    required this.startTime,
    required this.map,
    this.score = 0,
  });

  final DateTime startTime;
  final GameMap map;
  final int score;

  @override
  List<Object?> get props => [startTime, map, score];
}

class PlayingState extends StartedPlayingState {
  const PlayingState({
    required super.startTime,
    required super.map,
    super.score = 0,
  });
}

class GameOverState extends GameState {
  const GameOverState({
    required this.startTime,
    required this.score,
  });

  final DateTime startTime;
  final GameScore score;

  @override
  List<Object?> get props => [];
}
