import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/categories_news.dart';
import 'package:flutter_application_1/providers/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../comman/widgets.dart';
import '../providers/breaking_news.dart';
import '../widgets/appbar.dart';
import '../widgets/breakingNewsCarousel.dart';
import '../widgets/news_recommendation.dart';
import '../widgets/spacer.dart';

class NewsPage extends ConsumerStatefulWidget {
  const NewsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewsPageState();
}

class _NewsPageState extends ConsumerState<NewsPage> {
  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),  
        child: Column(
          children: [
            appBar(context: context, detailPage: false),
            mediumHeightSpcer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Breaking News',
                    style: pStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 20)),
                TextButton(
                  onPressed: () {},
                  child: Text('View all',
                      style: pStyle.copyWith(
                          fontWeight: FontWeight.w600, fontSize: 10)),
                ),
              ],
            ),
            smallHeightSpcer,
            const BreakingNewsCarousel(),
            const Expanded(child: Recommendation())
          ],
        ),
      ),
    );
  }

  void fetchNews() async {
    final result = await ref.read(newsProvider.notifier).fetchNews();
    final catresult =
        await ref.read(categoriesNewsProvider.notifier).fetchNews();
    await ref.read(breakingNewsCarousel.notifier).fetchTopHeadLines();

    if (result != "Success" || catresult != "Success") {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result + catresult)));
    }
  }
}
