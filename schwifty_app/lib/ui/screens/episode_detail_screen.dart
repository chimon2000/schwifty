import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:schwifty_app/providers.dart';

class EpisodeDetailScreen extends ConsumerWidget {
  const EpisodeDetailScreen({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodeAsync = ref.watch(episodeProvider(id));

    return Scaffold(
      body: episodeAsync.when(
        data: (data) {
          final characters = data.characters?.map(
                (character) {
                  final characterUrlParts = character.split("/");
                  final characterId =
                      characterUrlParts[characterUrlParts.length - 1];

                  return characterId;
                },
              ) ??
              [];

          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    data.name!,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(
                    data.airDate!,
                  ),
                ),
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Characters',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Gap(16),
                for (final character in characters)
                  _EpisodeCharacter(id: int.parse(character))
              ],
            ),
          );
        },
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

class _EpisodeCharacter extends ConsumerWidget {
  const _EpisodeCharacter({
    // ignore: unused_element
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterAsync = ref.watch(characterProvider(id));

    return ListTile(
      title: characterAsync.when(
        data: (data) => Text(data.name!),
        error: (error, stackTrace) => const Text('Error :('),
        loading: () => const Text('Loading'),
      ),
    );
  }
}
