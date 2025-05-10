import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kite/model/story.dart';
import 'package:kite/ui/story/screen/story_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:timeago/timeago.dart' as timeago;

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    final article = story.articles.firstWhereOrNull((article) => article.image.isNotEmpty);

    return InkWell(
      onTap: () => Navigator.of(context).push(StoryScreen.route(story: story)),
      child: IntrinsicHeight(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (story.category.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          story.category.toUpperCase(),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    if (article != null) ...[
                      Text(
                        timeago.format(article.date),
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
                      ),
                      SizedBox(height: 4),
                    ],
                    Text(
                      story.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              if (article != null && article.image.isNotEmpty)
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: SizedBox(
                      width: 96,
                      child: Hero(
                        tag: article.image,
                        child: Image.network(
                          article.image,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Shimmer.fromColors(
                              baseColor: Theme.of(context).colorScheme.outlineVariant,
                              highlightColor: Theme.of(context).colorScheme.outlineVariant.withAlpha(128),
                              child: Container(color: Theme.of(context).colorScheme.outlineVariant),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Theme.of(context).colorScheme.outlineVariant,
                              child: const Center(child: Icon(Icons.image_not_supported)),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
