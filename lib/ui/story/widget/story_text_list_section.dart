import 'package:flutter/material.dart';
import 'package:kite/core/ui/widget/widget_extension.dart';

class StoryTextListSection extends StatelessWidget {
  const StoryTextListSection({super.key, required this.title, required this.content});

  final String title;
  final List<String> content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        ...content.map((actionItem) => Text('• $actionItem')).joinWith(SizedBox(height: 8)),
      ],
    );
  }
}
