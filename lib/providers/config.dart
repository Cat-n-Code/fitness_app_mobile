import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'config.g.dart';

class AppConfig {
  const AppConfig({
    required this.apiBaseUrl,
    required this.apiTimeLimit,
    required this.apiMinTime,
  });

  final Uri apiBaseUrl;
  final Duration apiTimeLimit;
  final Duration apiMinTime;
}

@Riverpod(keepAlive: true)
AppConfig config(ConfigRef ref) => AppConfig(
      apiBaseUrl: Uri.parse(dotenv.env['API_BASE_URL']!),
      apiTimeLimit: const Duration(seconds: 3),
      apiMinTime: const Duration(milliseconds: 300),
    );
