import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/spacer.dart';

Widget appBar({required bool detailPage, required BuildContext context}) {
  bool isBookmark = false;
  if (detailPage) {
    return Container(
      color: Colors.transparent,
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.black.withOpacity(.5)),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
            color: Colors.white,
          ),
        ),
        const Spacer(),
        StatefulBuilder(
          builder: (context, setState) {
            return Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.black.withOpacity(.5)),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isBookmark = !isBookmark;
                  });
                },
                // ignore: dead_code
                icon:
                    Icon(isBookmark ? Icons.bookmark_outline : Icons.bookmark),
                color: Colors.white,
              ),
            );
          },
        ),
        tinyWidthSpcer,
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.black.withOpacity(.5)),
          child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              )),
        ),
      ]),
    );
  } else {
    return Row(children: [
      Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
          color: Colors.black,
        ),
      ),
      const Spacer(),
      Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: Colors.black,
        ),
      ),
      tinyWidthSpcer,
      Container(
        decoration:
            BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.black,
            )),
      ),
    ]);
  }
}
