import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kite/model/story.dart';
import 'package:kite/ui/story/screen/story_screen.dart';

class FeaturedStoryCard extends StatelessWidget {
  const FeaturedStoryCard({super.key, required this.story});

  final Story story;

  @override
  Widget build(BuildContext context) {
    final article = story.articles.firstWhereOrNull((article) => article.image.isNotEmpty);

    return InkWell(
      onTap: () => Navigator.of(context).push(StoryScreen.route(story: story)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (article != null)
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Hero(
                        tag: article.image,
                        child: Image.network(
                          article.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[300],
                              child: const Center(child: Icon(Icons.image_not_supported)),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  if (story.category.isNotEmpty)
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.black87, borderRadius: BorderRadius.circular(4)),
                        child: Text(
                          story.category,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                ],
              ),
            const SizedBox(height: 8),
            Text(
              story.title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(story.shortSummary, maxLines: 3, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
