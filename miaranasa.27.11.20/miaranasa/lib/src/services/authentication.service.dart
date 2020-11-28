import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationService {
  void saveUser(Map<String, String> inputs) {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    _prefs.then((value) {
      value.setString("user", json.encode(inputs));
    });
  }
}
