import 'package:flame/game.dart';
import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/cubits/ui_visibility_cubit.dart';
import 'package:flappy_dash/features/game/flappy_dash_game.dart';
import 'package:flappy_dash/features/home/widgets/flutter_tip_banner.dart';
import 'package:flappy_dash/features/home/widgets/home_controls.dart';
import 'package:flappy_dash/features/overlays/game_over_overlay.dart';
import 'package:flappy_dash/features/overlays/main_menu_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final FlappyDashGame _game;

  @override
  void initState() {
    super.initState();

    _game = FlappyDashGame(
      gameCubit: context.read<GameCubit>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);
    final isVertical = screenSize.width < screenSize.height;

    final gameCubit = context.watch<GameCubit>();

    final uiVisibilityCubit = context.watch<UIVisibilityCubit>();

    final hideUI = switch (gameCubit.state) {
      PlayingState() => true,
      _ => switch (uiVisibilityCubit.state) {
        UIVisibleState() => false,
        UIInvisibleState() => true,
      },
    };

    return Scaffold(
      floatingActionButton: hideUI ? null : const HomeControls(),
      body: Stack(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            child: GameWidget(game: _game),
          ),

          switch (gameCubit.state) {
            GameOverState() => const GameOverOverlay(),
            MainMenuGameState() => const MainMenuOverlay(),
            StartedPlayingState() || PlayingState() => PositionedDirectional(
              top: isVertical ? null : AppSpacings.s32.value,
              bottom: isVertical ? AppSpacings.s32.value : null,
              start: isVertical ? AppSpacings.s32.value : null,
              end: AppSpacings.s32.value,
              child: const IgnorePointer(
                child: FlutterTipBanner(),
              ),
            ),
          },
        ],
      ),
    );
  }
}
