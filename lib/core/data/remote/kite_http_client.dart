import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final httpClientProvider = Provider<KiteHttpClient>((ref) {
  return KiteHttpClient(baseUrl: 'kite.kagi.com');
});

class KiteHttpClient {
  const KiteHttpClient({required String baseUrl}) : _baseUrl = baseUrl;

  final String _baseUrl;

  Future<http.Response> get(String path, {Map<String, String>? headers}) {
    final url = Uri.https(_baseUrl, path);
    return http.get(url, headers: headers);
  }
}
