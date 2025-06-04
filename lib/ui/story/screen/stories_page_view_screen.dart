import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kite/model/story.dart';
import 'package:kite/ui/story/screen/story_screen.dart';

class StoriesPageViewScreen extends StatefulWidget {
  const StoriesPageViewScreen({super.key, required this.stories, required this.initialIndex});

  final List<Story> stories;
  final int initialIndex;

  static Route<void> route({required List<Story> stories, required int initialIndex}) {
    return MaterialPageRoute<void>(
      builder: (_) => StoriesPageViewScreen(stories: stories, initialIndex: initialIndex),
    );
  }

  @override
  State<StoriesPageViewScreen> createState() => _StoriesPageViewState();
}

class _StoriesPageViewState extends State<StoriesPageViewScreen> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.stories.length,
        onPageChanged: _onPageChanged,
        allowImplicitScrolling: false,
        itemBuilder: (context, index) {
          final story = widget.stories[index];
          return StoryScreen(story: story);
        },
      ),
    );
  }
}
