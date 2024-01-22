import 'package:flutter/material.dart';
import 'package:flutter_application_1/comman/utils/string_formate.dart';
import 'package:flutter_application_1/pages/newsDetail.dart';
import 'package:flutter_application_1/widgets/spacer.dart';

import '../comman/widgets.dart';
import '../models/news.dart';

class CarouselItem extends StatelessWidget {
  const CarouselItem({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsDetailPage(news: news)));
      },
      child: Card(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                  image: NetworkImage(
                    news.urlToImage,
                  ),
                  fit: BoxFit.cover)),
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomCenter,
                  // stops: [0.9, 0.1],
                  colors: [Colors.transparent, Colors.black.withOpacity(.7)]),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Badge(
                  largeSize: 30,
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  label: Text(firstCapital(news.type!)),
                  backgroundColor: Colors.blue,
                  // child:
                ),
                const Spacer(),
                Text(
                  news.author,
                  style: pStyle.copyWith(
                      color: Colors.white.withOpacity(.9), fontSize: 13),
                ),
                tinyHeightSpcer,
                Text(
                  news.title,
                  maxLines: 2,
                  overflow: TextOverflow.fade,
                  style: pStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                mediumHeightSpcer
              ],
            ),
          ),
        ),
      ),
    );
  }
}
