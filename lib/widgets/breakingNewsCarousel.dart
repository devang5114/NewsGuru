import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_application_1/comman/widgets.dart';
import 'package:flutter_application_1/widgets/carousel_item.dart';
import 'package:flutter_application_1/widgets/spacer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/breaking_news.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BreakingNewsCarousel extends ConsumerStatefulWidget {
  const BreakingNewsCarousel({super.key});

  @override
  ConsumerState<BreakingNewsCarousel> createState() =>
      _BreakingNewsCarouselState();
}

class _BreakingNewsCarouselState extends ConsumerState<BreakingNewsCarousel> {
  late CarouselController carouselController;
  late PageController pageController;

  @override
  void initState() {
    carouselController = CarouselController();
    pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newslist = ref.watch(breakingNewsCarousel);
    return Column(
      children: [
        CarouselSlider(
            carouselController: carouselController,
            items: newslist.map((news) => CarouselItem(news: news)).toList(),
            options: CarouselOptions(
              autoPlay: true,
              height: MediaQuery.of(context).size.height * 0.25,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                // setState(() {
                //  pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
                // });
              },
            )),
        smallHeightSpcer,
      ],
    );
  }
}
