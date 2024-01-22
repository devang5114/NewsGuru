import 'package:flutter_application_1/services/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/news.dart';

class NewsNotifier extends StateNotifier<List<News>> {
  NewsNotifier() : super([]);
  NewsApi newsapi = NewsApi();

  Future<String> fetchNews() async {
    final result = await newsapi.fetchNews;

    if (result.newsList != null) {
      state = result.newsList!;
      return "Success";
    } else {
      return result.error!;
    }
  }

  Future<String> searchNews(String source) async {
    final result = await newsapi.searchNews(source);

    if (result.newsList != null) {
      state = result.newsList!;
      return "Success";
    } else {
      return result.error!;
    }
  }
}

final newsProvider = StateNotifierProvider<NewsNotifier, List<News>>((ref) {
  return NewsNotifier();
});
