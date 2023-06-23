import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
  String PREFS_KEY_TOKEN = 'PREFS_KEY_TOKEN';

  // Future<String> getAppLanguage() async {
  //   String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
  //   if (language != null && language.isNotEmpty) {
  //     return language;
  //   } else {
  //     return LanguageType.ENGLISH.getValue();
  //   }
  // }

  // Future<void> setAppLanguage({required String lang}) async {
  //   String currentLanguage = await getAppLanguage();
  //   if (lang == currentLanguage) {
  //   } else {
  //     _sharedPreferences.setString(PREFS_KEY_LANG, lang);
  //   }
  // }

  // Future<Locale> getLocal() async {
  //   String currentLanguage = await getAppLanguage();
  //   if (currentLanguage == LanguageType.ARABIC.getValue()) {
  //     return ARABIC_LOCAL;
  //   } else {
  //     return ENGLISH_LOCAL;
  //   }
  // }

  Future<void> setUserToken(String token) async {
    _sharedPreferences.setString(PREFS_KEY_TOKEN, token);
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(PREFS_KEY_TOKEN) ?? '';
  }
}
