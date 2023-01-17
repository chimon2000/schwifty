import 'package:dart_frog/dart_frog.dart';
import 'package:requests/requests.dart';

Future<Response> onRequest(RequestContext context) async {
  final r = await Requests.get('https://rickandmortyapi.com/api/character');

  return Response(body: r.body);
}
