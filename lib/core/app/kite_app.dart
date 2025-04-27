import 'package:flutter/material.dart';
import 'package:kite/features/feed/ui/screen/feed_screen.dart';

class KiteApp extends StatelessWidget {
  const KiteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Kite', home: const FeedScreen());
  }
}
