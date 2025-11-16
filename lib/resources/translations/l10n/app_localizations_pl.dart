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
      'Nie używaj null-safety, kiedyś wszystko działało bez tego';

  @override
  String get game_flutter_tips_2 =>
      'Nie dziel kodu na pliki – jeden duży plik to prawdziwa siła seniora';

  @override
  String get game_flutter_tips_3 =>
      'Nie używaj const, bo wtedy kod wygląda zbyt poważnie';

  @override
  String get game_flutter_tips_4 =>
      'Zawsze ustawiaj “shrinkWrap: true”, bo to super wygodne';

  @override
  String get game_flutter_tips_5 =>
      'Dodawaj komentarz do każdego wiersza kodu, żeby wyglądało, że się naprawdę narobiłeś';

  @override
  String get game_flutter_tips_6 =>
      'Jeśli czegoś nie ma w Materialu, to znaczy, że nie da się tego we Flutterze zrobić';

  @override
  String get game_flutter_tips_7 =>
      'Pisz wszystko w jednym drzewie widgetów, to nie będziesz musiał przekazywać rzeczy przez konstruktory';

  @override
  String get game_flutter_tips_8 =>
      'Linter to strata czasu. Przecież się kompiluje, więc co za różnica?';

  @override
  String get game_flutter_tips_9 =>
      'Formatowanie kodu jest zbędne i zabija indywidualny styl programisty';

  @override
  String get game_flutter_tips_10 =>
      'Jeżeli wszystkie Twoje Providery będą globalne, to nigdy nie natrafisz na wyjątek „ProviderNotFound”';

  @override
  String get game_flutter_tips_11 =>
      'Nie działa Ci test? Daj flagę “skip” na true, a przestanie się sypać';

  @override
  String get game_flutter_tips_12 =>
      'Slivery są proste. “SliverToBoxAdapter” z “SingleChildScrollView” z “Column” i masz super layout';

  @override
  String get game_flutter_tips_13 =>
      'Po co w ogóle ten Flutter, Kotlin wygodniejszy';

  @override
  String get game_flutter_tips_14 =>
      'Warningi to tylko sugestie, nie musisz ich przestrzegać';

  @override
  String get game_flutter_tips_15 => 'Zawsze rób print() zamiast debuggera';

  @override
  String get game_flutter_tips_16 =>
      'Używaj var wszędzie – typy są dla słabych';

  @override
  String get game_flutter_tips_17 => 'Nie rób refaktoryzacji – to zabija flow!';

  @override
  String get game_flutter_tips_18 =>
      'Nigdy nie aktualizuj paczek – przecież działało w 2021';

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
  String get phone_emulator_wrapper_switch_to_phone =>
      'Przełącz w tryb emulacji telefonu';

  @override
  String get settings_scoreboard => 'Tablica wyników';

  @override
  String get settings_settings => 'Ustawienia';
}
