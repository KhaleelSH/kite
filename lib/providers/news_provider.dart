import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/data/news_data_provider.dart';
import 'package:kite/model/category.dart';
import 'package:kite/model/event.dart';
import 'package:kite/model/story.dart';

final newsProvider = FutureProvider<void>((ref) async {
  ref.onDispose(() {
    ref.invalidate(categoriesProvider);
    ref.invalidate(storiesProvider);
    ref.invalidate(onThisDayProvider);
  });

  final categories = await ref.read(categoriesProvider.future);

  final storiesFutures = <Future<List>>[];
  for (final category in categories.values.where((category) => category.file != 'onthisday.json')) {
    storiesFutures.add(ref.read(storiesProvider(category).future));
  }
  storiesFutures.add(ref.read(onThisDayProvider.future));
  await Future.wait(storiesFutures);
});

final categoriesProvider = FutureProvider<Map<String, Category>>((ref) async {
  final categoriesList = await ref.read(newsDataProvider).getNewsCategories();
  return {for (var category in categoriesList) category.name: category};
});

final storiesProvider = FutureProvider.family<List<Story>, Category>((ref, category) async {
  return ref.read(newsDataProvider).getNewsStories(category);
});

final onThisDayProvider = FutureProvider<List<Event>>((ref) async {
  return ref.read(newsDataProvider).getOnThisDayEvents();
});
