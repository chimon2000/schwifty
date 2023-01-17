import 'package:dart_frog/dart_frog.dart';
import 'package:requests/requests.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final r = await Requests.get('https://rickandmortyapi.com/api/character/$id');

  return Response.json(statusCode: r.statusCode, body: r.json());
}
