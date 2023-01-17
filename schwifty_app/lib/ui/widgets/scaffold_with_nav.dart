import 'package:flutter/material.dart';
import 'package:schwifty_app/ui/router.dart';

class ScaffoldWithNav extends StatelessWidget {
  const ScaffoldWithNav({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  router.go('/');
                },
                child: const Text('Home'),
              ),
              TextButton(
                onPressed: () {
                  router.go('/episodes');
                },
                child: const Text('Episodes'),
              ),
              TextButton(
                onPressed: () {
                  router.go('/characters');
                },
                child: const Text('Characters'),
              )
            ],
          ),
        ),
      ),
      body: child,
    );
  }
}
