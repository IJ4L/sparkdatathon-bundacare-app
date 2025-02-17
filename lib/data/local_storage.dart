import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static SharedPreferences? _prefs;

  LocalStorage._();

  static final LocalStorage instance = LocalStorage._();

  Future<void> _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  Future<void> saveTokenToSharedPreferences(String accessToken) async {
    if (_prefs == null) {
      await _init();
    }

    await _prefs!.setString('accessToken', accessToken);
  }

  Future<String?> getTokenFromSharedPreferences() async {
    if (_prefs == null) {
      await _init();
    }

    return _prefs!.getString('accessToken');
  }

  Future<void> removeTokenFromSharedPreferences() async {
    if (_prefs == null) {
      await _init();
    }

    await _prefs!.remove('accessToken');
  }
}
