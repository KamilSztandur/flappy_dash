import 'package:flappy_dash/common/language/language_cubit.dart';
import 'package:flappy_dash/common/shared_preferences.dart';
import 'package:flappy_dash/features/leaderboard/repositories/leaderboard_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
    required this.child,
    required this.preferences,
  });

  final Widget child;
  final SharedPreferences preferences;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => LeaderboardRepository()),
        Provider(create: (context) => AppSharedPreferences(preferences)),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) {
              final prefs = context.read<AppSharedPreferences>();

              return LanguageCubit(preferredLanguage: prefs.language);
            },
          ),
        ],
        child: child,
      ),
    );
  }
}
