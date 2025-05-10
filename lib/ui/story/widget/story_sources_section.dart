import 'package:flutter/material.dart';
import 'package:kite/model/article.dart';
import 'package:kite/model/domain.dart';

class StorySourcesSection extends StatelessWidget {
  const StorySourcesSection({super.key, required this.articles, required this.domains});

  final List<Article> articles;
  final List<Domain> domains;

  @override
  Widget build(BuildContext context) {
    // Create a map to count articles per domain
    final Map<String, int> domainArticleCounts = {};

    // Count articles for each domain
    for (final article in articles) {
      domainArticleCounts[article.domain] = (domainArticleCounts[article.domain] ?? 0) + 1;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text('Sources', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 8,
            children:
                domains.map((domain) {
                  final articleCount = domainArticleCounts[domain.name] ?? 0;

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceBright,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            if (domain.favicon.isNotEmpty) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  domain.favicon,
                                  width: 16,
                                  height: 16,
                                  errorBuilder: (context, error, stackTrace) => const Icon(Icons.public, size: 16),
                                ),
                              ),
                              const SizedBox(width: 4),
                            ],

                            Text(domain.name),
                          ],
                        ),
                        if (articleCount > 0)
                          Text(
                            '$articleCount ${articleCount > 1 ? 'articles' : 'article'}',
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
