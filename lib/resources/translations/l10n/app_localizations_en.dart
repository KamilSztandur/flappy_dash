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
      'Don’t use null-safety, everything used to work fine without it anyway.';

  @override
  String get game_flutter_tips_2 =>
      'Don’t split code into files – one giant file is the true power of a senior developer.';

  @override
  String get game_flutter_tips_3 =>
      'Don’t use const, it makes the code look way too serious.';

  @override
  String get game_flutter_tips_4 =>
      'Always set “shrinkWrap: true” because it’s super convenient.';

  @override
  String get game_flutter_tips_5 =>
      'Add a comment to every single line so it looks like you worked really hard.';

  @override
  String get game_flutter_tips_6 =>
      'If something isn’t in Material, it simply can’t be done in Flutter.';

  @override
  String get game_flutter_tips_7 =>
      'Write everything in one massive widget tree so you never have to pass anything through constructors.';

  @override
  String get game_flutter_tips_8 =>
      'Linter is a waste of time. It compiles, so what’s the problem?';

  @override
  String get game_flutter_tips_9 =>
      'Code formatting is unnecessary and kills a developer’s unique artistic style.';

  @override
  String get game_flutter_tips_10 =>
      'If all your Providers are global, you’ll never hit a “ProviderNotFound” exception.';

  @override
  String get game_flutter_tips_11 =>
      'Test failing? Set “skip” to true and it magically stops failing.';

  @override
  String get game_flutter_tips_12 =>
      'Slivers are easy. Just mix “SliverToBoxAdapter” with “SingleChildScrollView” and “Column” for an amazing layout.';

  @override
  String get game_flutter_tips_13 =>
      'Why even bother with Flutter? Kotlin is more comfortable anyway.';

  @override
  String get game_flutter_tips_14 =>
      'Warnings are just friendly suggestions; you don’t need to listen to them.';

  @override
  String get game_flutter_tips_15 =>
      'Always use print() instead of the debugger.';

  @override
  String get game_flutter_tips_16 =>
      'Używaj var wszędzie – typy są dla słabych';

  @override
  String get game_flutter_tips_17 => 'Never refactor – it kills your flow!';

  @override
  String get game_flutter_tips_18 =>
      'Never update packages – everything worked perfectly in 2021.';

  @override
  String get game_flutter_tips_19 =>
      'Always use StatefulWidget; maybe someday you’ll actually use its state.';

  @override
  String get game_flutter_tips_20 =>
      'There’s nothing more I can teach you — you’re already a perfect senior.';

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
  String get phone_emulator_wrapper_switch_to_fullscreen =>
      'Switch to desktop mode';

  @override
  String get phone_emulator_wrapper_switch_to_phone =>
      'Switch to Phone Emulator Mode';

  @override
  String get settings_scoreboard => 'Scoreboard';

  @override
  String get settings_settings => 'Settings';
}
