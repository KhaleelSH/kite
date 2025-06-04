import 'dart:convert' show json;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/core/constants/storage_constants.dart';
import 'package:kite/core/data/local/shared_preferences_data_provider.dart';

final enabledCategoriesDataProvider = Provider<EnabledCategoriesDataProvider>((ref) {
  return EnabledCategoriesDataProvider(ref.read(sharedPreferencesProvider));
});

class EnabledCategoriesDataProvider {
  EnabledCategoriesDataProvider(this._sharedPreferencesDataProvider);

  final SharedPreferencesDataProvider _sharedPreferencesDataProvider;

  Future<void> updateEnabledCategories(List<String> categories) async {
    await _sharedPreferencesDataProvider.setString(
      key: StorageConstants.categoriesSettingKey,
      value: json.encode(categories),
    );
  }

  List<String>? getEnabledCategories() {
    final categoriesString = _sharedPreferencesDataProvider.getString(key: StorageConstants.categoriesSettingKey);
    if (categoriesString != null && categoriesString.isNotEmpty) {
      return json.decode(categoriesString).cast<String>();
    }
    return null;
  }
}
