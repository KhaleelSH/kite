import 'package:flutter/material.dart';
import 'package:kite/core/ui/widget/widget_extension.dart';

class StoryActionItemsSection extends StatelessWidget {
  const StoryActionItemsSection({super.key, required this.userActionItems});

  final List<String> userActionItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Action items', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          ...userActionItems
              .map(
                (actionItem) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text('•'), const SizedBox(width: 8), Expanded(child: Text(actionItem))],
                ),
              )
              .joinWith(SizedBox(height: 8)),
        ],
      ),
    );
  }
}
