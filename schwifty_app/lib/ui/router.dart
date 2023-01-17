import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:schwifty_app/ui/screens/screens.dart';

import 'package:schwifty_app/ui/widgets/scaffold_with_nav.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNav(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'episodes',
              builder: (context, state) => const EpisodesListScreen(),
            ),
            GoRoute(
              path: 'characters',
              builder: (context, state) => const CharacterListScreen(),
            ),
            GoRoute(
              path: 'episodes/:id',
              builder: (context, state) =>
                  EpisodeDetailScreen(id: int.parse(state.params['id']!)),
            ),
            GoRoute(
              path: 'characters/:id',
              builder: (context, state) =>
                  CharacterDetailScreen(id: int.parse(state.params['id']!)),
            ),
          ],
        )
      ],
    ),
  ],
);
