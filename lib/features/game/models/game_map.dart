import 'package:equatable/equatable.dart';
import 'package:flappy_dash/features/game/components/obstacle.dart';

class GameMap with EquatableMixin {
  GameMap({
    required this.obstacles,
    required this.scoreMilestones,
  });

  final List<Obstacle> obstacles;
  final Set<double> scoreMilestones;

  @override
  List<Object?> get props => [obstacles, scoreMilestones];
}
