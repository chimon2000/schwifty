import 'package:dart_frog/dart_frog.dart';
import 'package:requests/requests.dart';
import 'package:riverpod/riverpod.dart';
import 'package:schwifty_api/providers.dart';

Future<Response> onRequest(RequestContext context, String id) async {
  final r = await context
      .read<ProviderContainer>()
      .read(episodeByIdProvider(id).future);

  return Response.json(statusCode: r.statusCode, body: r.json());
}
