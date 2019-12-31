import 'package:life_style_hub/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  Future<SharedPreferences> _getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<bool> isActivityLaunch(String key) async {
    return await _getPrefs().then((pref) {
      return pref.getBool(key);
    });
  }

  void setActivityLaunch(String key, bool value) async {
    await _getPrefs().then((pref) {
      pref.setBool(key, value);
    });
  }

  Future<String> getString(String key) async {
    return await _getPrefs().then((pref) {
      return pref.getString(key);
    });
  }

  void setString(String key, String value) async {
    await _getPrefs().then((pref) {
      pref.setString(key, value);
    });
  }

  void setEmail(String value) async {
    await _getPrefs().then((pref) {
      pref.setString(SESSION_KEY_EMAIL, value);
    });
  }

  Future<String> getEmail() async {
    return await _getPrefs().then((pref) {
      return pref.getString(SESSION_KEY_EMAIL);
    });
  }

  Future<bool> isEmail() async {
    return await _getPrefs().then((pref) {
      return pref.containsKey(SESSION_KEY_EMAIL);
    });
  }

  Future<bool> isLogin() async {
    return await _getPrefs().then((pref) {
      return pref.containsKey(SESSION_KEY_LOGIN);
    });
  }

  void setLogin(bool value) async {
    await _getPrefs().then((pref) {
      pref.setBool(SESSION_KEY_LOGIN, value);
    });
  }

  void setName(String value) async {
    await _getPrefs().then((pref) {
      pref.setString(SESSION_KEY_NAME, value);
    });
  }

  Future<String> getName() async {
    return await _getPrefs().then((pref) {
      return pref.getString(SESSION_KEY_NAME);
    });
  }

  void setToken(String value) async {
    await _getPrefs().then((pref) {
      pref.setString(SESSION_KEY_TOKEN, value);
    });
  }

  Future<String> getToken() async {
    return await _getPrefs().then((pref) {
      return pref.getString(SESSION_KEY_TOKEN);
    });
  }

  void clear() async {
    await _getPrefs().then((pref) {
      pref.clear();
    });
  }

  void removeAll() async {
    await _getPrefs().then((pref) {
      pref.setBool(SESSION_KEY_EMAIL, false);
      pref.getKeys();
      for (String key in pref.getKeys()) {
        if (key != SESSION_KEY_EMAIL) {
          pref.remove(key);
        }
      }
    });
  }
}
