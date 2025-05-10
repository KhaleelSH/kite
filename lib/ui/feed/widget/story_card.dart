import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kite/model/story.dart';
import 'package:kite/ui/story/screen/story_screen.dart';

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
                    Text(
                      story.title,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // const SizedBox(height: 8),
                    // Row(
                    //   children: [
                    //     if (story.domains.isNotEmpty) Expanded(child: _buildSourceInfo(story.domains.first)),
                    //     if (article != null && article.date.isNotEmpty)
                    //       Text(article.date, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    //   ],
                    // ),
                    // const Spacer(),
                    // if (story.talkingPoints.isNotEmpty)
                    //   Text(
                    //     story.talkingPoints.first,
                    //     style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    //     maxLines: 2,
                    //     overflow: TextOverflow.ellipsis,
                    //   ),
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}
