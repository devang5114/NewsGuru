import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/spacer.dart';

import '../comman/widgets.dart';

class PackagePage extends StatelessWidget {
  const PackagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You free Pack is Over\n Subscribe to prime',
                  style: pStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            mediumHeightSpcer,
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 20),
                      content: Text('Out of service')));
                },
                child: const Text('Subsribe prime'))
          ],
        ),
      ),
    );
  }
}
