import 'package:flame/game.dart';
import 'package:flappy_dash/common/language/language_cubit.dart';
import 'package:flappy_dash/design_system/language/switch_language_button.dart';
import 'package:flappy_dash/features/game/game.dart';
import 'package:flappy_dash/features/game/models/game_score.dart';
import 'package:flappy_dash/features/game/models/game_stage.dart';
import 'package:flappy_dash/features/overlays/game_over_overlay.dart';
import 'package:flappy_dash/features/overlays/main_menu_overlay.dart';
import 'package:flappy_dash/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlappyDashApp extends StatefulWidget {
  const FlappyDashApp({super.key});

  @override
  State<FlappyDashApp> createState() => _FlappyDashAppState();
}

class _FlappyDashAppState extends State<FlappyDashApp> {
  late final FlappyDashGame _game;

  GameScore? _score;

  @override
  void initState() {
    super.initState();

    _game = FlappyDashGame(
      onGameOver: (score) => setState(() {
        _score = score;
      }),
      onGameStarted: () => setState(() {
        _score = null;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageCubit()),
      ],
      child: Builder(
        builder: (context) => MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: context.watch<LanguageCubit>().state.locale,
          home: Scaffold(
            floatingActionButton: const SwitchLanguageButton(),
            body: Stack(
              children: [
                GameWidget(game: _game),
                switch (_game.progress.stage) {
                  GameStage.gameOver => GameOverOverlay(
                    score: _score!,
                    onRestartTap: _game.start,
                  ),
                  GameStage.mainMenu => MainMenuOverlay(
                    onStartTap: _game.start,
                  ),
                  GameStage.game => const SizedBox.shrink(),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
