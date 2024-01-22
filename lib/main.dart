import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'NewsGuru',
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
            useMaterial3: true,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
            )),
        home: const RoutePage());
  }
}
