import 'package:flutter/material.dart';
import 'package:flutter_application_1/comman/utils/date_formater.dart';
import 'package:flutter_application_1/widgets/appbar.dart';
import 'package:flutter_application_1/widgets/spacer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../comman/utils/string_formate.dart';
import '../comman/widgets.dart';
import '../models/news.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.news});
  final News news;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    print(news.description);
    return Hero(
      tag: news.url,
      child: Scaffold(
        body: Stack(children: [
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.5,
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(news.urlToImage),
                          fit: BoxFit.cover)),
                  child: Container(
                      height: size.height * 0.5,
                      width: size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            stops: [
                              0.2,
                              0.9,
                            ],
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(.7)
                            ]),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (news.type != null)
                              Badge(
                                largeSize: 30,
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                ),
                                label: Text(
                                  firstCapital(news.type!),
                                  style: pStyle.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.blue,
                                // child:
                              ),
                            smallHeightSpcer,
                            Text(
                              news.title,
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: pStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            tinyHeightSpcer,
                            Row(
                              children: [
                                if (news.type != null)
                                  Text(
                                    "Top headline",
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: pStyle.copyWith(
                                        fontSize: 13,
                                        color: Colors.white.withOpacity(.8),
                                        fontWeight: FontWeight.w500),
                                  ),
                                if (news.type != null) smallWidthSpcer,
                                Text(
                                  formateDate(news.publishedAt),
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: pStyle.copyWith(
                                      fontSize: 10,
                                      color: Colors.white.withOpacity(.8),
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            extraLargeHeightSpcer,
                            smallHeightSpcer
                          ],
                        ),
                      )),
                ),
                Container(
                  width: size.width,
                  margin: EdgeInsets.only(
                    top: size.height * 0.45,
                  ),
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        smallHeightSpcer,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                news.source[0],
                                style: pStyle.copyWith(color: Colors.white),
                              ),
                            ),
                            tinyWidthSpcer,
                            Text(
                              news.source,
                              style: pStyle.copyWith(
                                  fontWeight: FontWeight.w700, fontSize: 15),
                            ),
                            tinySmallWidthSpcer,
                            const Icon(
                              Icons.verified,
                              color: Colors.blue,
                            )
                          ],
                        ),
                        smallHeightSpcer,
                        Text(
                          "    " + news.description,
                          style: pStyle.copyWith(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                        smallHeightSpcer,
                        Text(
                          "   -> " + news.content,
                          style: pStyle.copyWith(
                              fontWeight: FontWeight.w300, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 50,
              left: 20,
              right: 20,
              child: appBar(context: context, detailPage: true)),
          Positioned(
            bottom: 30,
            left: size.width * 0.2,
            right: size.width * 0.2,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () async {
                  await launchUrl(Uri.parse(news.url));
                },
                child: Text(
                  'Open on Site',
                  style: pStyle.copyWith(color: Colors.white),
                )),
          ),
        ]),
      ),
    );
  }
}
