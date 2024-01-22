import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/news.dart';
import 'news_tile.dart';

class RecommendationList extends ConsumerWidget {
  const RecommendationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<News> recomNews = ref.watch(newsProvider);
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0, right: 0),
      itemCount: recomNews.length,
      itemBuilder: (context, index) {
        final news = recomNews[index];
        return NewsTile(news: news);
      },
    );
  }
}
