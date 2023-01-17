import 'package:riverpod/riverpod.dart';
import 'package:requests/requests.dart';
import 'package:schwifty_app/models/character/character.dart';
import 'package:schwifty_app/models/episode.dart';

final episodesFutureProvider = FutureProvider<List<Episode>>((ref) async {
  var r = await Requests.get('$apiUrl/episodes');

  r.throwForStatus();
  final json = r.json() as Map<String, dynamic>;

  return (json['results'] as List<dynamic>)
      .map((e) => Episode.fromJson(e))
      .toList();
});

final charactersFutureProvider = FutureProvider<List<Character>>((ref) async {
  var r = await Requests.get('$apiUrl/characters');

  r.throwForStatus();
  final json = r.json() as Map<String, dynamic>;

  return (json['results'] as List<dynamic>)
      .map((e) => Character.fromJson(e))
      .toList();
});

final characterProvider =
    FutureProvider.family<Character, int>((ref, id) async {
  var r = await Requests.get('$apiUrl/characters/$id');

  r.throwForStatus();
  final json = r.json() as Map<String, dynamic>;

  return Character.fromJson(json);
});

final episodeProvider = FutureProvider.family<Episode, int>((ref, id) async {
  var r = await Requests.get('$apiUrl/episodes/$id');

  r.throwForStatus();
  final json = r.json() as Map<String, dynamic>;

  return Episode.fromJson(json);
});

const apiUrl = 'http://localhost:8080';
