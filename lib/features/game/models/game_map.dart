import 'package:equatable/equatable.dart';
import 'package:flappy_dash/features/game/components/pipe.dart';

class GameMap with EquatableMixin {
  GameMap({
    required this.pipes,
    required this.scoreMilestones,
  });

  final List<Pipe> pipes;
  final Set<double> scoreMilestones;

  @override
  List<Object?> get props => [pipes, scoreMilestones];
}
