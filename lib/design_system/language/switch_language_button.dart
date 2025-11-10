import 'package:flappy_dash/common/language/language_cubit.dart';
import 'package:flappy_dash/design_system/spacings.dart';
import 'package:flappy_dash/resources/translations/language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchLanguageButton extends StatelessWidget {
  const SwitchLanguageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final languageCubit = context.watch<LanguageCubit>();
    final selectedLanguage = languageCubit.state;

    final nextIndex = (selectedLanguage.index + 1) % AppLanguage.values.length;
    final nextLanguage = AppLanguage.values[nextIndex];

    return FloatingActionButton(
      backgroundColor: Colors.white30,
      onPressed: () => context.read<LanguageCubit>().update(nextLanguage),
      child: Padding(
        padding: AppSpacings.s8.all,
        child: nextLanguage.flag.svg(height: 48),
      ),
    );
  }
}
