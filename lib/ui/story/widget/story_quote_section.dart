import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryQuoteSection extends StatelessWidget {
  const StoryQuoteSection({
    super.key,
    required this.quote,
    required this.quoteAuthor,
    required this.quoteSourceUrl,
    required this.quoteSourceDomain,
  });

  final String quote;
  final String quoteAuthor;
  final String quoteSourceUrl;
  final String quoteSourceDomain;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (quoteSourceUrl.isNotEmpty) {
          launchUrl(Uri.parse(quoteSourceUrl), mode: LaunchMode.inAppBrowserView);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('❝', style: TextStyle(fontSize: 28)),
            Text(quote, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontStyle: FontStyle.italic)),
            Text.rich(
              TextSpan(
                children: [
                  if (quoteAuthor.isNotEmpty) ...[
                    TextSpan(text: ' — $quoteAuthor', style: Theme.of(context).textTheme.titleSmall),
                  ],
                  if (quoteSourceDomain.isNotEmpty) ...[
                    TextSpan(text: ' (via $quoteSourceDomain)', style: Theme.of(context).textTheme.bodySmall),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
