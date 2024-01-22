import 'package:flutter/material.dart';
import 'package:flutter_application_1/comman/utils/string_formate.dart';
import 'package:flutter_application_1/comman/widgets.dart';
import 'package:flutter_application_1/providers/categories_selector.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../comman/constant/enums.dart';

class CategoryBar extends ConsumerWidget {
  const CategoryBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(categoriesProvider);
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          for (var cat in NewsCategoryEnum.values)
            Container(
              margin: const EdgeInsets.only(right: 5),
              child: ChoiceChip(
                  onSelected: (value) {
                    ref.read(categoriesProvider.notifier).setCategory(cat);
                  },
                  label: Text(
                    firstCapital(cat.name),
                    style: pStyle,
                  ),
                  selected: cat == category),
            )
        ]));
  }
}
