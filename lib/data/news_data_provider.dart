import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/core/data/remote/kite_http_client.dart';
import 'package:kite/model/category.dart';
import 'package:kite/model/event.dart';
import 'package:kite/model/story.dart';

final newsDataProvider = Provider<NewsDataProvider>((ref) {
  return NewsDataProvider(ref.read(httpClientProvider));
});

class NewsDataProvider {
  const NewsDataProvider(this._httpClient);

  final KiteHttpClient _httpClient;

  Future<List<Category>> getNewsCategories() async {
    final response = await _httpClient.get('kite.json');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['categories'];
      return data.map((category) => Category.fromJson(category)).toList();
    } else {
      throw HttpException('Failed to load news categories');
    }
  }

  Future<List<Story>> getNewsStories(Category category) async {
    final response = await _httpClient.get(category.file);
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['clusters'];
      return data.map((story) => Story.fromJson(story)).toList();
    } else {
      throw HttpException('Failed to load news stories');
    }
  }

  Future<List<Event>> getOnThisDayEvents() async {
    final response = await _httpClient.get('onthisday.json');
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body)['events'];
      return data.map((story) => Event.fromJson(story)).toList();
    } else {
      throw HttpException('Failed to load on this day events');
    }
  }
}
