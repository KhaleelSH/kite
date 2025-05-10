import 'package:flutter/material.dart';
import 'package:kite/core/ui/widget/widget_extension.dart';

class StoryBusinessAngleSection extends StatelessWidget {
  const StoryBusinessAngleSection({super.key, required this.businessAngleText, required this.businessAnglePoints});

  final String businessAngleText;
  final List<String> businessAnglePoints;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Business angle', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        if (businessAngleText.isNotEmpty) ...[Text(businessAngleText), const SizedBox(height: 8)],
        if (businessAnglePoints.isNotEmpty)
          ...businessAnglePoints.map((actionItem) => Text('• $actionItem')).joinWith(SizedBox(height: 8)),
      ],
    );
  }
}
