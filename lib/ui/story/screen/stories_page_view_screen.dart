import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/model/story.dart';
import 'package:kite/providers/is_swipe_animation_shown_provider.dart';
import 'package:kite/ui/story/screen/story_screen.dart';
import 'package:kite/ui/story/widget/story_swipe_animation.dart';

class StoriesPageViewScreen extends ConsumerStatefulWidget {
  const StoriesPageViewScreen({super.key, required this.stories, required this.initialIndex});

  final List<Story> stories;
  final int initialIndex;

  static Route<void> route({required List<Story> stories, required int initialIndex}) {
    return MaterialPageRoute<void>(
      builder: (_) => StoriesPageViewScreen(stories: stories, initialIndex: initialIndex),
    );
  }

  @override
  ConsumerState<StoriesPageViewScreen> createState() => _StoriesPageViewState();
}

class _StoriesPageViewState extends ConsumerState<StoriesPageViewScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    HapticFeedback.lightImpact();
    ref.read(isSwipeAnimationShownProvider.notifier).pageHasChanged();
  }

  @override
  Widget build(BuildContext context) {
    final isSwipeAnimationShown = ref.watch(isSwipeAnimationShownProvider);
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: widget.stories.length,
            onPageChanged: _onPageChanged,
            allowImplicitScrolling: true,
            itemBuilder: (context, index) {
              final story = widget.stories[index];
              return StoryScreen(story: story);
            },
          ),
          if (!isSwipeAnimationShown) StorySwipeAnimation(),
        ],
      ),
    );
  }
}
