import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl'),
  ];

  /// No description provided for @common_switch_language.
  ///
  /// In en, this message translates to:
  /// **'Przełącz na polski'**
  String get common_switch_language;

  /// No description provided for @game_flutter_tips_1.
  ///
  /// In en, this message translates to:
  /// **'Don’t use null-safety, everything used to work fine without it anyway.'**
  String get game_flutter_tips_1;

  /// No description provided for @game_flutter_tips_2.
  ///
  /// In en, this message translates to:
  /// **'Don’t split code into files – one giant file is the true power of a senior developer.'**
  String get game_flutter_tips_2;

  /// No description provided for @game_flutter_tips_3.
  ///
  /// In en, this message translates to:
  /// **'Don’t use const, it makes the code look way too serious.'**
  String get game_flutter_tips_3;

  /// No description provided for @game_flutter_tips_4.
  ///
  /// In en, this message translates to:
  /// **'Always set “shrinkWrap: true” because it’s super convenient.'**
  String get game_flutter_tips_4;

  /// No description provided for @game_flutter_tips_5.
  ///
  /// In en, this message translates to:
  /// **'Add a comment to every single line so it looks like you worked really hard.'**
  String get game_flutter_tips_5;

  /// No description provided for @game_flutter_tips_6.
  ///
  /// In en, this message translates to:
  /// **'If something isn’t in Material, it simply can’t be done in Flutter.'**
  String get game_flutter_tips_6;

  /// No description provided for @game_flutter_tips_7.
  ///
  /// In en, this message translates to:
  /// **'Write everything in one massive widget tree so you never have to pass anything through constructors.'**
  String get game_flutter_tips_7;

  /// No description provided for @game_flutter_tips_8.
  ///
  /// In en, this message translates to:
  /// **'Linter is a waste of time. It compiles, so what’s the problem?'**
  String get game_flutter_tips_8;

  /// No description provided for @game_flutter_tips_9.
  ///
  /// In en, this message translates to:
  /// **'Code formatting is unnecessary and kills a developer’s unique artistic style.'**
  String get game_flutter_tips_9;

  /// No description provided for @game_flutter_tips_10.
  ///
  /// In en, this message translates to:
  /// **'If all your Providers are global, you’ll never hit a “ProviderNotFound” exception.'**
  String get game_flutter_tips_10;

  /// No description provided for @game_flutter_tips_11.
  ///
  /// In en, this message translates to:
  /// **'Test failing? Set “skip” to true and it magically stops failing.'**
  String get game_flutter_tips_11;

  /// No description provided for @game_flutter_tips_12.
  ///
  /// In en, this message translates to:
  /// **'Slivers are easy. Just mix “SliverToBoxAdapter” with “SingleChildScrollView” and “Column” for an amazing layout.'**
  String get game_flutter_tips_12;

  /// No description provided for @game_flutter_tips_13.
  ///
  /// In en, this message translates to:
  /// **'Why even bother with Flutter? Kotlin is more comfortable anyway.'**
  String get game_flutter_tips_13;

  /// No description provided for @game_flutter_tips_14.
  ///
  /// In en, this message translates to:
  /// **'Warnings are just friendly suggestions; you don’t need to listen to them.'**
  String get game_flutter_tips_14;

  /// No description provided for @game_flutter_tips_15.
  ///
  /// In en, this message translates to:
  /// **'Always use print() instead of the debugger.'**
  String get game_flutter_tips_15;

  /// No description provided for @game_flutter_tips_16.
  ///
  /// In en, this message translates to:
  /// **'Używaj var wszędzie – typy są dla słabych'**
  String get game_flutter_tips_16;

  /// No description provided for @game_flutter_tips_17.
  ///
  /// In en, this message translates to:
  /// **'Never refactor – it kills your flow!'**
  String get game_flutter_tips_17;

  /// No description provided for @game_flutter_tips_18.
  ///
  /// In en, this message translates to:
  /// **'Never update packages – everything worked perfectly in 2021.'**
  String get game_flutter_tips_18;

  /// No description provided for @game_flutter_tips_19.
  ///
  /// In en, this message translates to:
  /// **'Always use StatefulWidget; maybe someday you’ll actually use its state.'**
  String get game_flutter_tips_19;

  /// No description provided for @game_flutter_tips_20.
  ///
  /// In en, this message translates to:
  /// **'There’s nothing more I can teach you — you’re already a perfect senior.'**
  String get game_flutter_tips_20;

  /// No description provided for @game_flutter_tips_progress_more.
  ///
  /// In en, this message translates to:
  /// **'Progress more to see more!'**
  String get game_flutter_tips_progress_more;

  /// No description provided for @game_flutter_tips_tip_out_of.
  ///
  /// In en, this message translates to:
  /// **'Flutter Tip #{count} (out of {total})'**
  String game_flutter_tips_tip_out_of(int count, int total);

  /// No description provided for @game_over_message.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1 {Your score was {count} point} other {Your score was {count} points}}'**
  String game_over_message(num count);

  /// No description provided for @game_over_title.
  ///
  /// In en, this message translates to:
  /// **'GAME OVER {username}!'**
  String game_over_title(String username);

  /// No description provided for @home_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get home_cancel;

  /// No description provided for @home_enter_username.
  ///
  /// In en, this message translates to:
  /// **'Enter username'**
  String get home_enter_username;

  /// No description provided for @home_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get home_save;

  /// No description provided for @home_username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get home_username;

  /// No description provided for @leaderboard_empty_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Play a game to get started'**
  String get leaderboard_empty_subtitle;

  /// No description provided for @leaderboard_empty_title.
  ///
  /// In en, this message translates to:
  /// **'No scores yet!'**
  String get leaderboard_empty_title;

  /// No description provided for @leaderboard_title.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard'**
  String get leaderboard_title;

  /// No description provided for @main_menu_press_anywhere_to_start.
  ///
  /// In en, this message translates to:
  /// **'TAP ANYWHERE TO RELEASE THE BIRD'**
  String get main_menu_press_anywhere_to_start;

  /// No description provided for @phone_emulator_wrapper_switch_to_fullscreen.
  ///
  /// In en, this message translates to:
  /// **'Switch to desktop mode'**
  String get phone_emulator_wrapper_switch_to_fullscreen;

  /// No description provided for @phone_emulator_wrapper_switch_to_phone.
  ///
  /// In en, this message translates to:
  /// **'Switch to Phone Emulator Mode'**
  String get phone_emulator_wrapper_switch_to_phone;

  /// No description provided for @settings_scoreboard.
  ///
  /// In en, this message translates to:
  /// **'Scoreboard'**
  String get settings_scoreboard;

  /// No description provided for @settings_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_settings;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
