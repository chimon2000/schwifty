import 'package:dart_frog/dart_frog.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

Handler middleware(Handler handler) {
  return handler.use(cors()).use(riverpod());
}

Middleware cors({
  Map<String, String>? headers,
  bool Function(String) originChecker = originAllowAll,
}) {
  return fromShelfMiddleware(
    corsHeaders(headers: headers, originChecker: originChecker),
  );
}

Middleware riverpod() {
  return provider<ProviderContainer>((context) => ProviderContainer());
}
