import 'package:flutter/material.dart';
import 'package:kite/model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryArticleImageSection extends StatelessWidget {
  const StoryArticleImageSection({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(article.link), mode: LaunchMode.inAppBrowserView),
      child: Stack(
        children: [
          Image.network(
            article.image,
            width: double.maxFinite,
            height: 250,
            fit: BoxFit.cover,
            semanticLabel: article.imageCaption,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 250,
                color: Theme.of(context).colorScheme.surfaceBright,
                child: const Center(child: Icon(Icons.image_not_supported)),
              );
            },
          ),
          if (article.imageCaption.isNotEmpty)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black.withAlpha(128),
                child: Text(
                  article.imageCaption,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white, fontStyle: FontStyle.italic),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
