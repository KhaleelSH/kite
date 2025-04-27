import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/core/app/kite_app.dart';

void runKiteApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  _lockOrientation();

  runApp(const ProviderScope(child: KiteApp()));
}

void _lockOrientation() {
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]);
}
