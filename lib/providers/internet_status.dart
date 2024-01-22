import 'package:flutter_application_1/comman/constant/enums.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class InternetNotifier extends StateNotifier<InternetStatus> {
  InternetNotifier() : super(InternetStatus.mobile) {
    checkInternetStatus();
  }

  void checkInternetStatus() async {
    Connectivity()
        .checkConnectivity()
        .asStream()
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        state = InternetStatus.mobile;
      } else if (result == ConnectivityResult.wifi) {
        state = InternetStatus.wifi;
      } else if (result == ConnectivityResult.none) {
        state = InternetStatus.none;
      }
    });
  }
}

final internetStatusProvider =
    StateNotifierProvider<InternetNotifier, InternetStatus>((ref) {
  return InternetNotifier();
});
