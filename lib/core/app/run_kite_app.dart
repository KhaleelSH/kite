import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/core/app/kite_app.dart';
import 'package:kite/core/data/local/shared_preferences_data_provider.dart';
import 'package:kite/core/data/local/shared_preferences_with_cache_builder.dart';

void runKiteApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  _lockOrientation();
  await SharedPreferencesWithCacheBuilder().build();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(
          SharedPreferencesDataProvider(SharedPreferencesWithCacheBuilder().cache),
        ),
      ],
      child: KiteApp(),
    ),
  );
}

void _lockOrientation() {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
}
