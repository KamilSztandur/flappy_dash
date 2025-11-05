// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String game_over_message(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Your score was $count points',
      one: 'Your score was $count point',
    );
    return '$_temp0';
  }

  @override
  String game_over_title(String username) {
    return 'GAME OVER $username!';
  }

  @override
  String get main_menu_press_anywhere_to_start =>
      'PRESS ANYWHERE TO RELEASE THE BIRD';
}
