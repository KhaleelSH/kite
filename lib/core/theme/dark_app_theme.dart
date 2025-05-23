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
      secondary: const Color(0xFF6285F0),
      onSecondary: Colors.white,
      secondaryContainer: const Color(0xFF364153),
      tertiaryContainer: const Color(0xFF2B411C),
      surface: const Color(0xFF1A202C),
      onSurface: const Color(0xFFE2E8F0),
      surfaceBright: const Color(0xFF364153),
      outlineVariant: const Color(0xFF364153),
    );

    final textTheme = TextTheme(
      titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
      titleSmall: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    );

    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      textTheme: textTheme,
      tabBarTheme: TabBarThemeData(
        labelColor: colorScheme.onSurface,
        unselectedLabelColor: colorScheme.onSurface,
        indicatorColor: colorScheme.primaryFixed,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        labelStyle: textTheme.bodyLarge,
      ),
      dividerTheme: DividerThemeData(indent: 16, endIndent: 16),
    );
  }
}
