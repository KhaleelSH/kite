import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/core/constants/storage_constants.dart';
import 'package:kite/core/data/local/shared_preferences_data_provider.dart';

final isSwipeAnimationShownProvider = NotifierProvider.autoDispose<IsSwipeAnimationShownNotifier, bool>(
  IsSwipeAnimationShownNotifier.new,
);

class IsSwipeAnimationShownNotifier extends AutoDisposeNotifier<bool> {
  late final SharedPreferencesDataProvider _sharedPreferencesProvider = ref.read(sharedPreferencesProvider);

  @override
  bool build() => _sharedPreferencesProvider.getBool(key: StorageConstants.swipeBetweenStoriesWasShownKey) ?? false;

  void pageHasChanged() async {
    state = true;
    await _sharedPreferencesProvider.setBool(key: StorageConstants.swipeBetweenStoriesWasShownKey, value: true);
  }
}
