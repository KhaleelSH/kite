import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/data/enabled_categories_data_provider.dart';
import 'package:kite/model/category.dart';
import 'package:kite/providers/news_provider.dart';

final enabledCategoriesProvider = NotifierProvider<EnabledCategoriesNotifier, List<Category>>(
  EnabledCategoriesNotifier.new,
);

class EnabledCategoriesNotifier extends Notifier<List<Category>> {
  @override
  List<Category> build() {
    const defaultCategoriesNames = ['World', 'Business', 'Technology', 'Science', 'Sports', 'OnThisDay'];
    final selectedCategoriesNames =
        ref.read(enabledCategoriesDataProvider).getEnabledCategories() ?? defaultCategoriesNames;
    final allCategories = ref.read(categoriesProvider).requireValue;
    return selectedCategoriesNames
        .where((categoryName) => allCategories.containsKey(categoryName))
        .map((categoryName) => allCategories[categoryName]!)
        .toList();
  }

  void updateCategories(List<Category> categories) {
    state = List<Category>.from(categories);
    ref
        .read(enabledCategoriesDataProvider)
        .updateEnabledCategories(categories.map((category) => category.name).toList());
  }
}
