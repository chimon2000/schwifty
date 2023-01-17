import 'package:flutter/material.dart';
import 'package:schwifty_app/ui/router.dart';

class SchwiftyApp extends StatelessWidget {
  const SchwiftyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Schwifty',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: router,
    );
  }
}
