import 'package:flutter/material.dart';
import 'package:flutter_application_1/comman/widgets.dart';
import 'package:flutter_application_1/widgets/recommendationList.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommendation',
              style: pStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 15),
            ),
            TextButton(
              onPressed: () {},
              child: Text('View all',
                  style: pStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 10)),
            ),
          ],
        ),
        const Expanded(child: RecommendationList()),
      ],
    );
  }
}
