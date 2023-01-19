import 'package:dart_frog/dart_frog.dart';
import 'package:riverpod/riverpod.dart';
import 'package:schwifty_api/providers.dart';

Response onRequest(RequestContext context) {
  final greeting = context.read<ProviderContainer>().read(helloWorldProvider);

  return Response(body: greeting);
}
