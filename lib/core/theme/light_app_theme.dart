import 'package:flutter/material.dart';
import 'package:kite/core/theme/app_theme.dart';

final ThemeData lightTheme = _LightAppTheme().theme();

@immutable
class _LightAppTheme extends AppTheme {
  @override
  ThemeData theme() {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: const Color(0xFFFFB319),
      primaryFixed: const Color(0xFFFFB319),
      secondary: const Color(0xFF6285F0),
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFFF3F6FE),
      tertiaryContainer: const Color(0xFFF1FAE8),
      surface: Colors.white,
      onSurface: const Color(0xFF1E2939),
      surfaceBright: const Color(0xFFF3F4F6),
    );

    final textTheme = TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    );

    return ThemeData(brightness: Brightness.light, colorScheme: colorScheme, textTheme: textTheme);
  }
}
