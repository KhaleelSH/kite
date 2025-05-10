import 'package:flutter/material.dart';

class StoryEventsTimelineSection extends StatelessWidget {
  const StoryEventsTimelineSection({super.key, required this.timeline});

  final List<String> timeline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Timeline of events',
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        for (final (index, event) in timeline.indexed)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Badge.count(
                      count: index + 1,
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      textStyle: Theme.of(context).textTheme.titleMedium,
                      textColor: Theme.of(context).colorScheme.onSecondary,
                    ),
                    if (index != timeline.length - 1)
                      Expanded(
                        child: Container(
                          width: 2,
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        event.split(':: ').first,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(event.split(':: ')[1]),
                      if (index != timeline.length - 1) const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
