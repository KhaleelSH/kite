import 'package:flutter/material.dart';
import 'package:kite/core/ui/widget/widget_extension.dart';

class StoryInternationalReactionsSection extends StatelessWidget {
  const StoryInternationalReactionsSection({super.key, required this.internationalReactions});

  final List<String> internationalReactions;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('International reactions', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        ...internationalReactions
            .map(
              (reaction) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceBright,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (reaction.split(': ').length > 1) ...[
                      Text(reaction.split(': ').first, style: Theme.of(context).textTheme.titleSmall),
                      Text(reaction.split(': ')[1]),
                    ] else
                      Text(reaction),
                  ],
                ),
              ),
            )
            .joinWith(const SizedBox(height: 8)),
      ],
    );
  }
}
