import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferencesDataProvider>((ref) {
  throw UnimplementedError('SharedPreferencesWithCache must be initialized');
});

class SharedPreferencesDataProvider {
  SharedPreferencesDataProvider(this._sharedPreferences);

  final SharedPreferencesWithCache _sharedPreferences;

  Future<void> clear() {
    return _sharedPreferences.clear();
  }

  bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }

  bool? getBool({required String key}) {
    return _sharedPreferences.getBool(key);
  }

  double? getDouble({required String key}) {
    return _sharedPreferences.getDouble(key);
  }

  int? getInt({required String key}) {
    return _sharedPreferences.getInt(key);
  }

  String? getString({required String key}) {
    return _sharedPreferences.getString(key);
  }

  Future<void> delete({required String key}) {
    return _sharedPreferences.remove(key);
  }

  Future<void> setBool({required String key, required bool value}) {
    return _sharedPreferences.setBool(key, value);
  }

  Future<void> setDouble({required String key, required double value}) {
    return _sharedPreferences.setDouble(key, value);
  }

  Future<void> setInt({required String key, required int value}) {
    return _sharedPreferences.setInt(key, value);
  }

  Future<void> setString({required String key, required String value}) {
    return _sharedPreferences.setString(key, value);
  }
}
