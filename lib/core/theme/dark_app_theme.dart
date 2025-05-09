import 'package:flutter/material.dart';
import 'package:kite/core/theme/app_theme.dart';

final ThemeData darkTheme = _DarkAppTheme().theme();

@immutable
class _DarkAppTheme extends AppTheme {
  @override
  ThemeData theme() {
    final colorScheme = ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color(0xFFFFB319),
      primaryFixed: const Color(0xFFFFB319),
      surface: const Color(0xFF1A202C),
      onSurface: const Color(0xFFE2E8F0),
    );

    return ThemeData(brightness: Brightness.dark, colorScheme: colorScheme);
  }
}
