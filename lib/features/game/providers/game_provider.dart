import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';

class GameProvider extends FlameBlocProvider<GameCubit, GameState> {
  GameProvider({
    required GameCubit gameCubit,
    required super.children,
  }) : super.value(value: gameCubit);
}
