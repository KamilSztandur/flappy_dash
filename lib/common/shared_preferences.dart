import 'package:flappy_dash/resources/translations/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPreferences {
  const AppSharedPreferences(this._preferences);

  final SharedPreferences _preferences;

  static const _languageKey = 'language';
  static const _usernameKey = 'username';

  Future<void> setLanguage(AppLanguage language) async {
    await _preferences.setString(_languageKey, language.countryCode);
  }

  AppLanguage get language {
    final languageCode = _preferences.getString(_languageKey);
    if (languageCode == null) {
      final deviceLanguage = AppLanguage.deviceLanguage();

      setLanguage(deviceLanguage);

      return deviceLanguage;
    }

    return AppLanguage.values.firstWhere(
      (language) => language.countryCode == languageCode,
      orElse: () => AppLanguage.english,
    );
  }

  Future<void> setUsername(String username) async {
    await _preferences.setString(_usernameKey, username);
  }

  String get username {
    final username = _preferences.getString(_usernameKey);
    if (username == null) {
      const defaultUsername = 'Anonymous';

      setUsername(defaultUsername);

      return defaultUsername;
    }

    return username;
  }
}
