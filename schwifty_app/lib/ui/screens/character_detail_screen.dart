import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:schwifty_app/providers.dart';

class CharacterDetailScreen extends ConsumerWidget {
  const CharacterDetailScreen({required this.id, super.key});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final characterAsync = ref.watch(characterProvider(id));

    return Scaffold(
      body: characterAsync.when(
        data: (data) {
          final episodes = data.episode?.map(
                (episode) {
                  final urlParts = episode.split("/");
                  final id = urlParts[urlParts.length - 1];

                  return id;
                },
              ) ??
              [];

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                const Gap(16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(
                    'Characters',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                const Gap(16),
                for (final episode in episodes)
                  _CharacterEpisode(id: int.parse(episode))
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

class _CharacterEpisode extends ConsumerWidget {
  const _CharacterEpisode({
    // ignore: unused_element
    super.key,
    required this.id,
  });

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodeAsync = ref.watch(episodeProvider(id));

    return ListTile(
      title: episodeAsync.when(
        data: (data) => Text(data.name!),
        error: (error, stackTrace) => const Text('Error :('),
        loading: () => const Text('Loading'),
      ),
    );
  }
}
