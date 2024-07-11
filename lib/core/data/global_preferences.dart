import 'package:meals_recipes/core/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPreferences {
  late final SharedPreferences _pref;

  Future<GlobalPreferences> instance() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<void> setBool(String key, bool value) async {
    await _pref.setBool(key, value);
  }

  Future<void> setString(String key, String value) async {
    await _pref.setString(key, value);
  }

  Future<void> setIsDeviceFirstOpen(bool value) async {
    await setBool(Constants.STORAGE_DEVICE_FIRST_OPEN, value);
  }

  bool getIsDeviceFirstOpen() {
    return _pref.getBool(Constants.STORAGE_DEVICE_FIRST_OPEN) ?? false;
  }

  Future<void> setUserToken(String value) async {
    await setString(Constants.STORAGE_USER_TOKEN, value);
  }

  bool getIsLogin() {
    return _pref.getBool(Constants.STORAGE_USER_TOKEN) != null;
  }

  bool getIsDarkMode() {
    return _pref.getBool(Constants.STORAGE_IS_DARK_MODE) ?? false;
  }

  void changeMode() {
    bool isDarkMode = getIsDarkMode();
    setBool(Constants.STORAGE_IS_DARK_MODE, !isDarkMode);
  }
}
