// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get common_switch_language => 'Switch to English';

  @override
  String game_over_message(num count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Twój wynik to $count punktów',
      many: 'Twój wynik to $count punktów',
      few: 'Twój wynik to $count punkty',
      one: 'Twój wynik to $count punkt',
    );
    return '$_temp0';
  }

  @override
  String game_over_title(String username) {
    return 'TO KONIEC $username!';
  }

  @override
  String get leaderboard_empty_subtitle => 'Zagraj, aby to zmienić';

  @override
  String get leaderboard_empty_title => 'Pusto tutaj!';

  @override
  String get leaderboard_title => 'Tablica wyników';

  @override
  String get main_menu_press_anywhere_to_start =>
      'KLIKNIJ GDZIEKOLWIEK, ABY UWOLNIĆ PTAKA';

  @override
  String get settings_scoreboard => 'Tablica wyników';

  @override
  String get settings_settings => 'Ustawienia';
}
