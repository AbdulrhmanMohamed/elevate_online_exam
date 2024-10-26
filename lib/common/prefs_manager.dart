import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class CacheHelper {
  static late SharedPreferences _preferences;
  CacheHelper() {
    //  init();
  }
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<bool> saveData({required String key, required dynamic value}) async {
    switch (value.runtimeType) {
      case const (String):
        return await _preferences.setString(key, value);
      case const (int):
        return await _preferences.setInt(key, value);

      case const (bool):
        return await _preferences.setBool(key, value);
      case const (double):
        return await _preferences.setDouble(key, value);
      default:
        throw Exception("Invalid type");
    }
  }

  static dynamic getData({required String key}) {
    var result = _preferences.get(key);
    log("Dynamic Result ,$result");
    return result;
  }
}
