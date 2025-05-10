import 'package:flutter/material.dart';

class StoryTextSection extends StatelessWidget {
  const StoryTextSection({super.key, required this.title, required this.content});

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [Text(title, style: Theme.of(context).textTheme.titleLarge), const SizedBox(height: 8), Text(content)],
    );
  }
}
