import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/core/ui/widget/animated_kite_logo.dart';
import 'package:kite/core/ui/widget/generic_error.dart';
import 'package:kite/providers/news_provider.dart';
import 'package:kite/ui/feed/screen/feed_screen.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsProviderAsync = ref.watch(newsProvider);
    ref.listen(newsProvider, (_, newsAsync) {
      newsAsync.maybeWhen(data: (_) => Navigator.of(context).pushReplacement(FeedScreen.route()), orElse: () {});
    });
    return Scaffold(
      body: switch (newsProviderAsync) {
        AsyncError(:final error, :final isLoading) when !isLoading => GenericError(
          exception: error,
          onRetry: () => ref.invalidate(newsProvider),
        ),
        _ => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 24,
            children: [
              const AnimatedKiteLogo(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 8,
                    children: [
                      Text(
                        'Kite',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Badge(
                        label: const Text('BETA'),
                        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                        textColor: Theme.of(context).colorScheme.onSecondaryContainer,
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      ),
                    ],
                  ),
                  Text(
                    'News. Elevated.',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              CircularProgressIndicator.adaptive(),
            ],
          ),
        ),
      },
    );
  }
}
