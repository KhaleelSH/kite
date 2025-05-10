import 'package:flutter/material.dart';
import 'package:kite/core/ui/widget/widget_extension.dart';
import 'package:kite/model/perspective.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryPerspectivesSection extends StatelessWidget {
  const StoryPerspectivesSection({super.key, required this.perspectives});

  final List<Perspective> perspectives;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Perspectives', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        ...perspectives
            .map(
              (perspective) => Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceBright,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (perspective.text.split(': ').length > 1) ...[
                      Text(perspective.text.split(': ').first, style: Theme.of(context).textTheme.titleSmall),
                      Text(perspective.text.split(': ')[1]),
                    ] else
                      Text(perspective.text),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      children: [
                        ...perspective.sources.map(
                          (source) => GestureDetector(
                            onTap: () {
                              if (source.url.isNotEmpty) {
                                launchUrl(Uri.parse(source.url), mode: LaunchMode.inAppBrowserView);
                              }
                            },
                            child: Text(
                              source.name,
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.secondary),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
            .joinWith(const SizedBox(height: 8)),
      ],
    );
  }
}
