import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';

class GameProviders extends Component {
  GameProviders({
    super.key,
    required this.gameCubit,
    required this.components,
  });

  final GameCubit gameCubit;
  final List<Component> components;

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    await add(
      FlameBlocProvider<GameCubit, GameState>.value(
        value: gameCubit,
        children: components,
      ),
    );
  }
}
