import 'package:flutter_application_1/models/news_cateogory.dart';
import 'package:flutter_application_1/services/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../comman/constant/api_constant.dart';

class CategoriesNewsNotifier extends StateNotifier<NewsCategory> {
  CategoriesNewsNotifier()
      : super(NewsCategory(
            business: [],
            entertainment: [],
            general: [],
            health: [],
            science: [],
            sports: [],
            technology: []));
  NewsApi newsApi = NewsApi();

  Future<String> fetchNews() async {
    try {
      final businees = await newsApi.fetchHeadlinesNews(Category.business);
      final entertainment =
          await newsApi.fetchHeadlinesNews(Category.entertainment);
      final general = await newsApi.fetchHeadlinesNews(Category.general);
      final health = await newsApi.fetchHeadlinesNews(Category.health);
      final science = await newsApi.fetchHeadlinesNews(Category.science);
      final sports = await newsApi.fetchHeadlinesNews(Category.sports);
      final technology = await newsApi.fetchHeadlinesNews(Category.technology);

      state = NewsCategory(
          business: businees,
          entertainment: entertainment,
          general: general,
          health: health,
          science: science,
          sports: sports,
          technology: technology);
      return "Success";
    } catch (e) {
      return e.toString();
    }
  }
}

final categoriesNewsProvider =
    StateNotifierProvider<CategoriesNewsNotifier, NewsCategory>((ref) {
  return CategoriesNewsNotifier();
});
