import 'package:kite/core/constants/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWithCacheBuilder {
  SharedPreferencesWithCacheBuilder._internal();

  factory SharedPreferencesWithCacheBuilder() => _singleton;

  static final SharedPreferencesWithCacheBuilder _singleton = SharedPreferencesWithCacheBuilder._internal();

  SharedPreferencesWithCache? _sharedPreferencesWithCache;

  SharedPreferencesWithCache get cache {
    if (_sharedPreferencesWithCache == null) {
      throw StateError('SharedPreferencesWithCache not initialized. Call build() first.');
    }
    return _sharedPreferencesWithCache!;
  }

  Future<void> build() async {
    if (_sharedPreferencesWithCache != null) return;

    _sharedPreferencesWithCache = await SharedPreferencesWithCache.create(
      cacheOptions: const SharedPreferencesWithCacheOptions(
        allowList: {StorageConstants.categoriesSettingKey, StorageConstants.swipeBetweenStoriesWasShownKey},
      ),
    );
  }
}
