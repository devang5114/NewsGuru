import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/news.dart';
import 'categories_news.dart';

class BreakingNewsNotifier extends StateNotifier<List<News>> {
  BreakingNewsNotifier(this.ref) : super([]);
  StateNotifierProviderRef<BreakingNewsNotifier, List<News>> ref;

  fetchTopHeadLines() async {
    List<News> allHeadlines = [];

    final categoreisNews = ref.watch(categoriesNewsProvider);
    allHeadlines.add(categoreisNews.business[0]);
    allHeadlines.add(categoreisNews.entertainment[0]);
    allHeadlines.add(categoreisNews.general[0]);
    allHeadlines.add(categoreisNews.health[0]);
    allHeadlines.add(categoreisNews.science[0]);
    allHeadlines.add(categoreisNews.sports[0]);
    allHeadlines.add(categoreisNews.technology[0]);

    state = allHeadlines;
  }
}

final breakingNewsCarousel =
    StateNotifierProvider<BreakingNewsNotifier, List<News>>((ref) {
  return BreakingNewsNotifier(ref);
});
