import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static SharedPreferences? _prefs;
  static Future<SharedPreferences> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  static Future<void> setString(String key, String value) async {
    await _prefs!.setString(key, value);
  }

  static Future<void> setInt(String key, int value) async {
    await _prefs!.setInt(key, value);
  }

  static Future<void> setDouble(String key, double value) async {
    await _prefs!.setDouble(key, value);
  }

  static Future<void> setBool(String key, bool value) async {
    await _prefs!.setBool(key, value);
  }

  static String? getString(
    String key,
  ) {
    return _prefs!.getString(key);
  }

  static bool getBool(
    String key,
  ) {
    bool? val;

    return val ?? false;
  }
}
