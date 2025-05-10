import 'package:flutter/material.dart';

class StoryDidYouKnowSection extends StatelessWidget {
  const StoryDidYouKnowSection({super.key, required this.didYouKnow});

  final String didYouKnow;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Did you know?', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(didYouKnow),
        ],
      ),
    );
  }
}
