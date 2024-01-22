import 'package:flutter/material.dart';
import 'package:flutter_application_1/comman/widgets.dart';
import 'package:flutter_application_1/providers/news_provider.dart';
import 'package:flutter_application_1/widgets/spacer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/categoryNews.dart';
import '../widgets/category_bar.dart';

class DiscoverPage extends ConsumerWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.fromLTRB(10, 40, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover',
                  style: pStyle.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                tinySmallHeightSpacer,
                Text(
                  'News from all around the world',
                  style: pStyle.copyWith(
                      color: Colors.grey,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                mediumHeightSpcer,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Search News',
                        hintStyle: pStyle,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 30),
                        prefixIcon: const Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        ref.read(newsProvider.notifier).searchNews(value);
                      },
                      onChanged: (value) {
                        if (value != '') {
                          ref.read(newsProvider.notifier).searchNews(value);
                        } else {
                          ref.read(newsProvider.notifier).fetchNews();
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          smallHeightSpcer,
          const CategoryBar(),
          mediumHeightSpcer,
          const Expanded(child: CategoryNews())
        ],
      ),
    ));
  }
}
