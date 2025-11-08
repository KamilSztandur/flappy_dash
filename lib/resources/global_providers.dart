import 'dart:async';

import 'package:flappy_dash/common/language/language_cubit.dart';
import 'package:flappy_dash/common/shared_preferences.dart';
import 'package:flappy_dash/features/game/cubits/game_cubit.dart';
import 'package:flappy_dash/features/game/cubits/ui_visibility_cubit.dart';
import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flappy_dash/features/phone_emulator/cubits/phone_emulator_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalProviders extends StatefulWidget {
  const GlobalProviders({
    super.key,
    required this.child,
    required this.preferences,
  });

  final Widget child;
  final SharedPreferences preferences;

  @override
  State<GlobalProviders> createState() => _GlobalProvidersState();
}

class _GlobalProvidersState extends State<GlobalProviders> {
  StreamSubscription<AppDisplayMode>? _appDisplayModeSubscription;

  @override
  void dispose() {
    _appDisplayModeSubscription?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => LeaderboardRepository()),
        Provider(create: (context) => AppSharedPreferences(widget.preferences)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final prefs = context.read<AppSharedPreferences>();

              return LanguageCubit(preferredLanguage: prefs.language);
            },
          ),
          BlocProvider(
            create: (context) => GameCubit(
              preferences: context.read(),
              leaderboardRepository: context.read(),
            ),
          ),
          BlocProvider(
            create: (context) => UIVisibilityCubit(),
          ),
          BlocProvider(
            create: (context) => AppDisplayModeCubit(),
          ),
        ],
        child: widget.child,
      ),
    );
  }
}
