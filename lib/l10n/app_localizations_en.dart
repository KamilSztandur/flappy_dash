// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get common_switch_language => 'Przełącz na polski';

  @override
  String get game_flutter_tips_1 =>
      'Ignore all errors – they only slow down your build.';

  @override
  String get game_flutter_tips_2 =>
      'Don’t test anything. If it works in your emulator, it works everywhere.';

  @override
  String get game_flutter_tips_3 =>
      'Używaj setState() absolutnie wszędzie, nawet w async callach.';

  @override
  String get game_flutter_tips_4 =>
      'Keep all colors, fonts, and paddings directly in your widgets.';

  @override
  String get game_flutter_tips_5 =>
      'Don’t split your code – one huge file shows true seniority.';

  @override
  String get game_flutter_tips_6 =>
      'Comment every single line, it makes you look like a hardworking person.';

  @override
  String get game_flutter_tips_7 =>
      'Avoid using const, it looks too serious D:';

  @override
  String get game_flutter_tips_8 =>
      'Never update packages – it worked fine back in 2021.';

  @override
  String get game_flutter_tips_9 =>
      'Skip null safety, back then everything worked fine without it';

  @override
  String get game_flutter_tips_10 =>
      'Always start a new project by copying an old one.';

  @override
  String get game_flutter_tips_11 =>
      'Use var everywhere – types are for the weak.';

  @override
  String get game_flutter_tips_12 =>
      'Never address code reviews – they’re just a waste of time.';

  @override
  String get game_flutter_tips_13 =>
      'Use a SingleChildScrollView with Column with a thousand children – sooo convenient!\n';

  @override
  String get game_flutter_tips_14 =>
      'Always hardcode your data directly in the widget, forget about providers.';

  @override
  String get game_flutter_tips_15 => 'Never refactor – it kills the mood!';

  @override
  String get game_flutter_tips_16 =>
      'Don\'t let debug console intimidate you, hide it';

  @override
  String get game_flutter_tips_17 =>
      'Always use print() instead of the debugger.';

  @override
  String get game_flutter_tips_18 =>
      'Keep logic and UI in one place, no need to overcomplicate.';

  @override
  String get game_flutter_tips_19 =>
      'Always use StatefulWidget, maybe some day you\'ll need its state';

  @override
  String get game_flutter_tips_20 =>
      'I have nothing left to teach you — you’re the perfect senior';

  @override
  String get game_flutter_tips_progress_more => 'Progress more to see more!';

  @override
  String game_flutter_tips_tip_out_of(int count, int total) {
    return 'Flutter Tip #$count (out of $total)';
  }

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
  String get home_cancel => 'Cancel';

  @override
  String get home_enter_username => 'Enter username';

  @override
  String get home_save => 'Save';

  @override
  String get home_username => 'Username';

  @override
  String get leaderboard_empty_subtitle => 'Play a game to get started';

  @override
  String get leaderboard_empty_title => 'No scores yet!';

  @override
  String get leaderboard_title => 'Leaderboard';

  @override
  String get main_menu_press_anywhere_to_start =>
      'TAP ANYWHERE TO RELEASE THE BIRD';

  @override
  String get settings_scoreboard => 'Scoreboard';

  @override
  String get settings_settings => 'Settings';
}
