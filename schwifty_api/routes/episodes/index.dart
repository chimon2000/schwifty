import 'package:dart_frog/dart_frog.dart';
import 'package:requests/requests.dart';

Future<Response> onRequest(RequestContext context) async {
  final r = await Requests.get('https://rickandmortyapi.com/api/episode');

  return Response.json(statusCode: r.statusCode, body: r.json());
}
