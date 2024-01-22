import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageNavProvider extends StateNotifier<int>{
  PageNavProvider():super(0);

  setPageIndex(int index){
    state = index;
  }

}
final pageNavigationProvider = StateNotifierProvider<PageNavProvider,int>((ref) =>PageNavProvider() );