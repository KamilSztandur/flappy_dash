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
  String get game_flutter_tips_1 =>
      'Ignoruj wszystkie błędy – one tylko spowalniają kompilację.';

  @override
  String get game_flutter_tips_2 =>
      'Nie testuj niczego. Jak działa na twoim emulatorze, to znaczy, że działa wszędzie.';

  @override
  String get game_flutter_tips_3 =>
      'Używaj setState() absolutnie wszędzie, nawet w async callach.';

  @override
  String get game_flutter_tips_4 =>
      'Trzymaj wszystkie kolory, czcionki i marginesy bezpośrednio w widgetach.';

  @override
  String get game_flutter_tips_5 =>
      'Nie dziel kodu na pliki – jeden duży plik to prawdziwa siła seniora.';

  @override
  String get game_flutter_tips_6 =>
      'Komentuj każdy wiersz kodu, żeby wyglądało że się napracowałeś.';

  @override
  String get game_flutter_tips_7 =>
      'Nie używaj const, bo to wygląda zbyt formalnie.';

  @override
  String get game_flutter_tips_8 =>
      'Nigdy nie aktualizuj paczek – przecież działało w 2021.';

  @override
  String get game_flutter_tips_9 =>
      'Nie używaj null safety, bo i tak wszystko działało bez tego.';

  @override
  String get game_flutter_tips_10 =>
      'Zawsze zaczynaj projekt od kopiowania starego folderu z innej apki.';

  @override
  String get game_flutter_tips_11 =>
      'Używaj var wszędzie – typy są dla słabych.\n';

  @override
  String get game_flutter_tips_12 =>
      'Nie czytaj code review – to tylko marnowanie czasu.';

  @override
  String get game_flutter_tips_13 =>
      'Używaj SingleChildScrollView z Column z tysiącem dzieci, jest wygodniej';

  @override
  String get game_flutter_tips_14 =>
      'Zawsze wrzucaj dane lokalne bezpośrednio do widgetu, zapomnij o providerze.';

  @override
  String get game_flutter_tips_15 => 'Nie rób refaktoryzacji – to zabija flow!';

  @override
  String get game_flutter_tips_16 =>
      'Nie daj się zastraszyć, wyłącz debug console';

  @override
  String get game_flutter_tips_17 => 'Zawsze rób print() zamiast debuggera.';

  @override
  String get game_flutter_tips_18 =>
      'Trzymaj logikę i UI w jednym miejscu, bo po co się rozdrabniać.';

  @override
  String get game_flutter_tips_19 =>
      'Używaj zawsze StatefulWidget, może kiedyś użyjesz jego stanu';

  @override
  String get game_flutter_tips_20 =>
      'Niczego więcej Cię już nie nauczę, jesteś perfekcyjnym seniorem';

  @override
  String get game_flutter_tips_progress_more =>
      'Graj dalej, żeby zobaczyć więcej!';

  @override
  String game_flutter_tips_tip_out_of(int count, int total) {
    return 'Flutter Tip #$count (z $total)';
  }

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
  String get home_cancel => 'Anuluj';

  @override
  String get home_enter_username => 'Wpisz Twoją nazwę';

  @override
  String get home_save => 'Zapisz';

  @override
  String get home_username => 'Twoja nazwa';

  @override
  String get leaderboard_empty_subtitle => 'Zagraj, aby to zmienić';

  @override
  String get leaderboard_empty_title => 'Pusto tutaj!';

  @override
  String get leaderboard_title => 'Tablica wyników';

  @override
  String get main_menu_press_anywhere_to_start =>
      'STUKNIJ GDZIEKOLWIEK, ABY UWOLNIĆ PTAKA';

  @override
  String get phone_emulator_wrapper_switch_to_fullscreen =>
      'Powróć do trybu desktopowego';

  @override
  String get settings_scoreboard => 'Tablica wyników';

  @override
  String get settings_settings => 'Ustawienia';
}
