import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.g.dart';

class AppConfig {
  const AppConfig({
    required this.enableFakeApi,
    required this.apiBaseUrl,
    required this.apiTimeLimit,
  });

  final bool enableFakeApi;
  final Uri apiBaseUrl;
  final Duration apiTimeLimit;
}

@Riverpod(keepAlive: true)
AppConfig config(ConfigRef ref) => AppConfig(
      enableFakeApi: bool.parse(dotenv.get(
        'ENABLE_FAKE_API',
        fallback: 'false',
      )),
      apiBaseUrl: Uri.parse(dotenv.env['API_BASE_URL']!),
      apiTimeLimit: const Duration(seconds: 3),
    );
