import 'package:flutter/material.dart';
import 'package:flutter_application_1/comman/constant/enums.dart';

import 'package:flutter_application_1/providers/categories_news.dart';
import 'package:flutter_application_1/providers/categories_selector.dart';
import 'package:flutter_application_1/providers/news_provider.dart';
import 'package:flutter_application_1/widgets/news_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/news.dart';

class CategoryNews extends ConsumerWidget {
  const CategoryNews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<News> catNews = fetchCategoryNews(ref);
    return ListView.builder(
      itemCount: catNews.length,
      padding: EdgeInsets.only(top: 0),
      itemBuilder: (context, index) {
        final news = catNews[index];
        return NewsTile(news: news);
      },
    );
  }

  List<News> fetchCategoryNews(WidgetRef ref) {
    final category = ref.watch(categoriesProvider);
    switch (category) {
      case NewsCategoryEnum.all:
        return ref.watch(newsProvider);

      case NewsCategoryEnum.business:
        return ref.watch(categoriesNewsProvider).business;
      case NewsCategoryEnum.entertainment:
        return ref.watch(categoriesNewsProvider).entertainment;

      case NewsCategoryEnum.general:
        return ref.watch(categoriesNewsProvider).general;

      case NewsCategoryEnum.health:
        return ref.watch(categoriesNewsProvider).health;

      case NewsCategoryEnum.science:
        return ref.watch(categoriesNewsProvider).science;
      case NewsCategoryEnum.sports:
        return ref.watch(categoriesNewsProvider).sports;
      case NewsCategoryEnum.technology:
        return ref.watch(categoriesNewsProvider).technology;
    }
  }
}
