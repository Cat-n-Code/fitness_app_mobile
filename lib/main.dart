import 'package:easy_localization/easy_localization.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:fitness_app/models/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:fitness_app/app.dart';
import 'package:fitness_app/providers/users.dart';
import 'package:fitness_app/routers.dart';

void main() async {
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await EasyLocalization.ensureInitialized();
  await dotenv.load();

  final container = ProviderContainer();
  final userOption = await container.read(currentUserNotifierProvider.future);
  switch (userOption) {
    case Some(value: final user):
      switch (user.role) {
        case Role.customer:
          router.go('/customer');
        case Role.coach:
          router.go('/coach');
      }
    case None():
      router.go('/startup');
  }

  FlutterNativeSplash.remove();

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: EasyLocalization(
        path: 'assets/locales',
        supportedLocales: const [Locale('en')],
        fallbackLocale: const Locale('en'),
        assetLoader: const YamlAssetLoader(),
        child: const App(),
      ),
    ),
  );
}
