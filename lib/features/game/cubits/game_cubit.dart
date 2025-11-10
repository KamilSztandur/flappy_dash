import 'package:equatable/equatable.dart';
import 'package:flappy_dash/common/shared_preferences.dart';
import 'package:flappy_dash/features/game/models/game_map.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flappy_dash/features/game/utils/game_map_generator.dart';
import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flappy_dash/resources/display/game_display_mode_provider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit({
    required AppSharedPreferences preferences,
    required LeaderboardRepository leaderboardRepository,
  }) : _preferences = preferences,
       _leaderboardRepository = leaderboardRepository,
       super(const MainMenuGameState());

  final AppSharedPreferences _preferences;
  final LeaderboardRepository _leaderboardRepository;

  void startGame({required Size screenSize}) {
    if (state is PlayingState || state is StartedPlayingState) {
      return;
    }

    emit(
      StartedPlayingState(
        startTime: DateTime.now(),
        map: GameMapGenerator(screenSize: screenSize).create(),
        isRestart: state is GameOverState,
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

  Future<void> gameOver() async {
    if (state case PlayingState(:final score, :final startTime)) {
      final userScore = GameScore(
        username: _preferences.username,
        value: score,
      );

      await _leaderboardRepository.writeScore(userScore);

      emit(
        GameOverState(
          startTime: startTime,
          endTime: DateTime.now(),
          score: userScore,
        ),
      );
    }
  }
}

sealed class GameState with EquatableMixin {
  const GameState();

  double calculateDistanceTravelled() {
    final startTime = switch (this) {
      StartedPlayingState(:final startTime) ||
      PlayingState(:final startTime) => startTime,
      GameOverState(:final startTime) => startTime,
      _ => DateTime.now(),
    };

    final endTime = switch (this) {
      GameOverState(:final endTime) => endTime,
      _ => DateTime.now(),
    };

    return startTime.difference(endTime).inMilliseconds.abs() *
        GameDisplayModeProvider.instance.gameHorizontalSpeed;
  }
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
    required this.isRestart,
  });

  final DateTime startTime;
  final GameMap map;
  final int score;
  final bool isRestart;

  @override
  List<Object?> get props => [startTime, map, score];
}

class PlayingState extends StartedPlayingState {
  const PlayingState({
    required super.startTime,
    required super.map,
    super.score = 0,
  }) : super(isRestart: false);
}

class GameOverState extends GameState {
  const GameOverState({
    required this.startTime,
    required this.endTime,
    required this.score,
  });

  final DateTime startTime;
  final DateTime endTime;
  final GameScore score;

  @override
  List<Object?> get props => [];
}
