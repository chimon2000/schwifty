import 'package:http/http.dart';
import 'package:requests/requests.dart';
import 'package:riverpod/riverpod.dart';

final helloWorldProvider = Provider((_) => 'Welcome to Dart Frog!');

final episodeListProvider = FutureProvider<Response>((ref) async {
  final r = await Requests.get('https://rickandmortyapi.com/api/episode');

  return r;
});

final episodeByIdProvider =
    FutureProvider.family<Response, String>((ref, id) async {
  final r = await Requests.get('https://rickandmortyapi.com/api/episode/$id');

  return r;
});

final characterListProvider = FutureProvider<Response>((ref) async {
  final r = await Requests.get('https://rickandmortyapi.com/api/character');

  return r;
});

final characterByIdProvider =
    FutureProvider.family<Response, String>((ref, id) async {
  final r = await Requests.get('https://rickandmortyapi.com/api/character/$id');

  return r;
});
