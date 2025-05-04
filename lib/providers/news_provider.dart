import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/data/news_data_provider.dart';
import 'package:kite/model/category.dart';
import 'package:kite/model/event.dart';
import 'package:kite/model/story.dart';

final categoriesProvider = FutureProvider<List<Category>>((ref) async {
  return ref.read(newsDataProvider).getNewsCategories();
});

final storiesProvider = FutureProvider.family<List<Story>, Category>((ref, category) async {
  return ref.read(newsDataProvider).getNewsStories(category);
});

final onThisDayProvider = FutureProvider<List<Event>>((ref) async {
  return ref.read(newsDataProvider).getOnThisDayEvents();
});
