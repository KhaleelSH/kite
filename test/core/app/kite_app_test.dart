import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kite/core/app/kite_app.dart';
import 'package:kite/ui/splash/screen/splash_screen.dart';

void main() {
  group('KiteApp', () {
    testWidgets('renders SplashScreen as initial screen', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProviderScope(child: KiteApp()));

      // Verify that the SplashScreen is displayed
      expect(find.byType(SplashScreen), findsOneWidget);
    });

    testWidgets('has correct title', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProviderScope(child: KiteApp()));

      // Get the MaterialApp widget
      final MaterialApp materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      
      // Verify that the title is correct
      expect(materialApp.title, 'Kite News');
    });

    testWidgets('has light and dark themes', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const ProviderScope(child: KiteApp()));

      // Get the MaterialApp widget
      final MaterialApp materialApp = tester.widget<MaterialApp>(find.byType(MaterialApp));
      
      // Verify that both light and dark themes are set
      expect(materialApp.theme, isNotNull);
      expect(materialApp.darkTheme, isNotNull);
    });
  });
}