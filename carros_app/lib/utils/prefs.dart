

import 'package:shared_preferences/shared_preferences.dart';

class Prefs{
  static Future<bool> getBool(String key) async{
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  static Future<void> setBool(String key, bool b) async {
    var prefs = await SharedPreferences.getInstance();
   prefs.setBool(key,b);
  }

  static Future<int> geInt(String key) async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }
  static Future<void> setInt (String key, int i) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, i);
  }
  static Future<String> getString(String key) async {
    var prefs = await  SharedPreferences.getInstance();
    return prefs.getString(key) ??  "";
  }
  static void setString(String key, String s) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString(key, s);
  }
}