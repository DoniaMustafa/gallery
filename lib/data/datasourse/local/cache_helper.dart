import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper {
  Future<bool> put(String kay, dynamic value);
  Future get(String kay);

}

class CacheImplement extends CacheHelper {
  final SharedPreferences _sharedPreferences;

  CacheImplement(this._sharedPreferences);

  @override
  Future get(String kay) async {
    return await jsonDecode(_sharedPreferences.get(kay).toString());
  }

  @override
  Future<bool> put(String kay, dynamic value) async {
    return _sharedPreferences.setString(kay, jsonEncode(value));
  }
}
