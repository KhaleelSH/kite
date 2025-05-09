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
      surface: Colors.white,
      onSurface: const Color(0xFF1E2939),
    );

    return ThemeData(brightness: Brightness.light, colorScheme: colorScheme);
  }
}
