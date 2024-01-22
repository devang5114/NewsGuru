import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/internet_status.dart';
import 'package:flutter_application_1/widgets/spacer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../comman/widgets.dart';

class OffLinePage extends ConsumerWidget {
  const OffLinePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You are Ofline',
              style: pStyle.copyWith(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            largeHeightSpcer,
            ElevatedButton(
                onPressed: () {
                  ref
                      .read(internetStatusProvider.notifier)
                      .checkInternetStatus();
                },
                child: Text('Retry'))
          ],
        ),
      ),
    );
  }
}
