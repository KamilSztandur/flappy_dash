import 'package:flappy_dash/common/language/language_cubit.dart';
import 'package:flappy_dash/features/home/home_screen.dart';
import 'package:flappy_dash/features/phone_emulator/phone_emulator_wrapper.dart';
import 'package:flappy_dash/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class FlappyDashApp extends StatefulWidget {
  const FlappyDashApp({super.key});

  @override
  State<FlappyDashApp> createState() => _FlappyDashAppState();
}

class _FlappyDashAppState extends State<FlappyDashApp> {
  final _homeScreenKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.watch<LanguageCubit>();

    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: languageCubit.state.locale,
      home: PhoneEmulatorWrapper(
        child: HomeScreen(key: _homeScreenKey),
      ),
    );
  }
}
