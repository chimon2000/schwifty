import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:schwifty_app/providers.dart';
import 'package:schwifty_app/ui/router.dart';

class EpisodesListScreen extends ConsumerWidget {
  const EpisodesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final episodesAsync = ref.watch(episodesFutureProvider);

    return episodesAsync.when(
      data: (data) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'Episodes',
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) => ListTile(
                title: Text('${data[index].episode!} - ${data[index].name!}'),
                onTap: () => router.push('/episodes/${data[index].id!}'),
              ),
              itemCount: data.length,
            ),
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
    );
  }
}
