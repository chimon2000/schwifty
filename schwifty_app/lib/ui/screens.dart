import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:schwifty_app/providers.dart';
import 'package:schwifty_app/ui/router.dart';

class CharacterDetailScreen extends ConsumerWidget {
  const CharacterDetailScreen({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterAsync = ref.watch(characterProvider(id));

    return Scaffold(
      body: characterAsync.when(
        data: (data) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                data.name!,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            ListTile(
              title: const Text('Gender'),
              subtitle: Text(data.gender!),
            ),
            ListTile(
              title: const Text('Status'),
              subtitle: Text(data.status!),
            ),
            ListTile(
              title: const Text('Species'),
              subtitle: Text(data.species!),
            ),
            ListTile(
              title: const Text('Origin'),
              subtitle: Text(data.origin!.name!),
            ),
          ],
        ),
        error: (error, stackTrace) => Center(
          child: Text(
            error.toString(),
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
