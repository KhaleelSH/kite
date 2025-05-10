import 'package:flutter/material.dart';
import 'package:kite/core/ui/widget/widget_extension.dart';

class StoryHighlightsSection extends StatelessWidget {
  const StoryHighlightsSection({super.key, required this.talkingPoints});

  final List<String> talkingPoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Highlights', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        ...talkingPoints.indexed
            .map((point) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                spacing: 8,
                children: [
                  Badge.count(
                    count: point.$1 + 1,
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    textStyle: Theme.of(context).textTheme.titleMedium,
                    textColor: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                  if (point.$2.split(': ').length > 1)
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(point.$2.split(': ').first, style: Theme.of(context).textTheme.titleMedium),
                          Text(point.$2.split(': ')[1]),
                        ],
                      ),
                    )
                  else
                    Expanded(child: Text(point.$2)),
                ],
              );
            })
            .joinWith(SizedBox(height: 8)),
      ],
    );
  }
}
