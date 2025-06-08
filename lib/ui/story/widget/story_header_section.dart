import 'package:cached_network_image/cached_network_image.dart';
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
          Semantics(
            label: mainArticle.imageCaption,
            child: CachedNetworkImage(
              imageUrl: mainArticle.image,
              fit: BoxFit.cover,
              errorWidget: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Theme.of(context).colorScheme.surfaceBright,
                  child: const Center(child: Icon(Icons.image_not_supported)),
                );
              },
              fadeInDuration: Duration.zero,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 120 + MediaQuery.of(context).padding.top,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.surfaceBright.withAlpha(200),
                    Theme.of(context).colorScheme.surfaceBright.withAlpha(120),
                    Colors.transparent,
                  ],
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
