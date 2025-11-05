import 'package:flappy_dash/common/language/language.dart';
import 'package:flappy_dash/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<AppLanguage> {
  LanguageCubit()
    : super(() {
        final basicLocale = basicLocaleListResolution(
          WidgetsBinding.instance.platformDispatcher.locales,
          AppLocalizations.supportedLocales,
        ).languageCode;

        return AppLanguage.values.firstWhere(
          (language) => language.countryCode == basicLocale,
          orElse: () => AppLanguage.english,
        );
      }());

  void update(AppLanguage language) {
    emit(language);
  }
}
