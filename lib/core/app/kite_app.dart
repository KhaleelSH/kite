import 'package:flutter/material.dart';
import 'package:kite/core/theme/dark_app_theme.dart';
import 'package:kite/core/theme/light_app_theme.dart';
import 'package:kite/ui/splash/screen/splash_screen.dart';

class KiteApp extends StatelessWidget {
  const KiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Kite News', theme: lightTheme, darkTheme: darkTheme, home: const SplashScreen());
  }
}
