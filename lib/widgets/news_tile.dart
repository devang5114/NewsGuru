import 'package:flutter/material.dart';
import 'package:flutter_application_1/comman/utils/date_formater.dart';
import 'package:flutter_application_1/widgets/spacer.dart';
import 'package:transparent_image/transparent_image.dart';

import '../comman/widgets.dart';
import '../models/news.dart';
import '../pages/newsDetail.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.news,
  });

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
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        // margin: EdgeInsets.only(bottom: 10),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            clipBehavior: Clip.hardEdge,
            child: Hero(
              tag: news.url,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(news.urlToImage),
                fit: BoxFit.cover,
                height: 125,
                width: 130,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (news.type != null)
                    Text(
                      news.type!,
                      style: pStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: Colors.grey),
                    ),
                  Text(
                    news.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: pStyle.copyWith(
                        fontWeight: FontWeight.w600, fontSize: 13),
                  ),
                  smallHeightSpcer,
                  Text(
                    news.author,
                    overflow: TextOverflow.ellipsis,
                    style: pStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        color: Colors.grey),
                  ),
                  Text(
                    formateDate(news.publishedAt),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: pStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 10,
                        color: Colors.grey),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
