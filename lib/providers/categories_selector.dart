import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../comman/constant/enums.dart';

class CategoriesNotifier extends StateNotifier<NewsCategoryEnum> {
  CategoriesNotifier() : super(NewsCategoryEnum.all);

  setCategory(NewsCategoryEnum category) {
    state = category;
  }
}

final categoriesProvider =
    StateNotifierProvider<CategoriesNotifier, NewsCategoryEnum>((ref) {
  return CategoriesNotifier();
});
