import 'package:flutter/material.dart';
import 'package:kite/model/article.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryHeaderSection extends StatelessWidget {
  const StoryHeaderSection({super.key, required this.mainArticle});

  final Article mainArticle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(mainArticle.link), mode: LaunchMode.inAppBrowserView),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: mainArticle.image,
            child: Image.network(
              mainArticle.image,
              fit: BoxFit.cover,
              semanticLabel: mainArticle.imageCaption,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Theme.of(context).colorScheme.surfaceBright,
                  child: const Center(child: Icon(Icons.image_not_supported)),
                );
              },
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 120,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black.withAlpha(200), Colors.black.withAlpha(120), Colors.transparent],
                ),
              ),
            ),
          ),
          if (mainArticle.imageCaption.isNotEmpty)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                color: Colors.black.withAlpha(128),
                child: Text(
                  mainArticle.imageCaption,
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
