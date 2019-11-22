
import 'dart:async';

import 'package:demo/prefs.dart';
import 'package:key_value_store_web/key_value_store_web.dart';
import 'dart:html' as html;

class WebPrefs implements PrefsInterface{
  WebKeyValueStore get prefs =>
    WebKeyValueStore(html.window.localStorage);


  @override
  FutureOr<bool> getBool(String key) {
    String s = prefs.getString(key);
    if(s != null){
      return s == "true";
    }
    return false;
  }

  @override
  FutureOr<int> getInt(String key) {
    String s = prefs.getString(key);
    if(s != null){
      return int.parse(s);
    }
    return 0;
  }

  @override
  FutureOr<String> getString(String key) {
    return prefs.getString(key) ?? "";
  }

  @override
  void setBool(String key, bool b) {
    prefs.setBool(key, b);
  }

  @override
  void setInt(String key, int i) {
    prefs.setInt(key, i);
  }

  @override
  void setString(String key, String s) {
    prefs.setString(key, s);
  }

}