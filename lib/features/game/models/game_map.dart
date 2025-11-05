import 'package:equatable/equatable.dart';
import 'package:flappy_dash/features/game/components/pipe.dart';

class GameMap with EquatableMixin {
  GameMap({
    required this.pipes,
  });

  final List<Pipe> pipes;

  @override
  List<Object?> get props => [pipes];
}
