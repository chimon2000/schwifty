import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schwifty_app/ui/router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Text.rich(
          TextSpan(text: 'Check out the ', children: [
            TextSpan(
              text: 'Episodes',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () => router.push('/episodes'),
            ),
            const TextSpan(text: ' and '),
            TextSpan(
              text: 'Characters',
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () => router.push('/characters'),
            ),
            const TextSpan(text: '!'),
          ]),
        ),
      ),
    );
  }
}
