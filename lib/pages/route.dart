import 'package:flutter/material.dart';
import 'package:flutter_application_1/comman/constant/enums.dart';
import 'package:flutter_application_1/pages/home/home.dart';
import 'package:flutter_application_1/pages/package.dart';
import 'package:flutter_application_1/providers/internet_status.dart';
import 'package:flutter_application_1/providers/news_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ofline.dart';

class RoutePage extends ConsumerWidget {
  const RoutePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final internetStatus = ref.watch(internetStatusProvider);
    final news = ref.read(newsProvider).length;
    if (internetStatus == InternetStatus.none) {
      return const OffLinePage();
    } else {
      return HomePage();
    }
  }
}
