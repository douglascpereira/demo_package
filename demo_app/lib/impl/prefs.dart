

import 'dart:async';

import 'package:demo/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs implements PrefsInterface {
  Future<SharedPreferences> get sharedPrefs => SharedPreferences.getInstance();

  @override
  FutureOr<bool> getBool(String key) async {
    final prefs = await sharedPrefs;
    bool b = prefs.getBool(key);
    return b ?? false;
  }

  @override
  FutureOr<int> getInt(String key) async {
    final prefs = await sharedPrefs;
    int i = prefs.getInt(key);
    return i ?? 0;
  }

  @override
  FutureOr<String> getString(String key) async {
    final prefs = await sharedPrefs;
    String s = prefs.getString(key);
    return s ?? "";
  }

  @override
  void setBool(String key, bool b) async{
    final prefs = await sharedPrefs;
    prefs.setBool(key, b);
  }

  @override
  void setInt(String key, int i) async {
    final prefs = await sharedPrefs;
    prefs.setInt(key, i);
  }

  @override
  void setString(String key, String s) async {
    final prefs = await sharedPrefs;
    prefs.setString(key, s);
  }

}