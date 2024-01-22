import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/news.dart';
import 'package:flutter_application_1/pages/profile.dart';
import 'package:flutter_application_1/providers/navigation.dart';
import 'package:flutter_application_1/widgets/navigation_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../discover.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerWidget {
  HomePage({super.key});

  List<Widget> pages = [
    const NewsPage(),
    const DiscoverPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int index = ref.watch(pageNavigationProvider);
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: const MyNavbar(),
    );
  }
}
