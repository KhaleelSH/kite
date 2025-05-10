import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kite/model/category.dart';
import 'package:kite/providers/news_provider.dart';
import 'package:kite/ui/feed/widget/featured_story_card.dart';
import 'package:kite/ui/feed/widget/story_card.dart';
import 'package:kite/ui/today_in_history/screen/today_in_history_screen.dart';

class FeedScreen extends ConsumerStatefulWidget {
  const FeedScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const FeedScreen());
  }

  @override
  ConsumerState<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends ConsumerState<FeedScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: ref.read(categoriesProvider).requireValue.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(categoriesProvider).requireValue;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Hero(
              tag: 'kite-logo',
              child: SvgPicture.asset('assets/svg/kite_${Theme.of(context).brightness.name}.svg', width: 32),
            ),
            const SizedBox(width: 8),
            Text('Kite', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          tabs: categories.map((category) => Tab(text: category.name)).toList(),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                for (final category in categories)
                  if (category.name == 'OnThisDay') const TodayInHistoryScreen() else _buildNewsFeed(category),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsFeed(Category category) {
    final stories = ref.watch(storiesProvider(category)).requireValue;
    if (stories.isEmpty) {
      return const Center(child: Text('No stories available'));
    }
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(height: 1),
      itemCount: stories.length,
      itemBuilder: (context, index) {
        final story = stories[index];
        if (index == 0) {
          return FeaturedStoryCard(story: story);
        } else {
          return StoryCard(story: story);
        }
      },
    );
  }
}
