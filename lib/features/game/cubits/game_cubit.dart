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
    if (state is PlayingState) {
      return;
    }

    emit(
      PlayingState(
        startTime: DateTime.now(),
        map: GameMapGenerator(screenHeight: screenHeight).create(),
        wasRestarted: state is GameOverState,
      ),
    );
  }

  void updateScore() {
    if (state case final PlayingState state) {
      var reachedMilestones = 0;

      final distanceTraveled = state.calculateDistanceTravelled();

      for (final milestone in state.map.scoreMilestones) {
        if (distanceTraveled >= milestone) {
          reachedMilestones++;
        }
      }

      emit(state.copyWith(score: reachedMilestones));
    }
  }

  void gameOver() {
    if (state case PlayingState(:final score)) {
      emit(
        GameOverState(
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
    PlayingState(:final startTime) =>
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

class PlayingState extends GameState {
  const PlayingState({
    required this.startTime,
    required this.map,
    this.score = 0,
    this.wasRestarted = false,
  });

  final DateTime startTime;
  final GameMap map;
  final int score;
  final bool wasRestarted;

  PlayingState copyWith({DateTime? startTime, GameMap? map, int? score}) =>
      PlayingState(
        startTime: startTime ?? this.startTime,
        map: map ?? this.map,
        score: score ?? this.score,
      );

  @override
  List<Object?> get props => [startTime, map, score];
}

class GameOverState extends GameState {
  const GameOverState({
    required this.score,
  });

  final GameScore score;

  @override
  List<Object?> get props => [];
}
