import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kite/model/category.dart';
import 'package:kite/providers/enabled_categories_provider.dart';
import 'package:kite/providers/news_provider.dart';
import 'package:kite/ui/feed/widget/featured_story_card.dart';
import 'package:kite/ui/feed/widget/story_card.dart';
import 'package:kite/ui/settings/screen/settings_screen.dart';
import 'package:kite/ui/today_in_history/screen/today_in_history_screen.dart';

class FeedScreen extends ConsumerWidget {
  const FeedScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const FeedScreen());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enabledCategories = ref.watch(enabledCategoriesProvider);
    return DefaultTabController(
      length: enabledCategories.length,
      child: Scaffold(
        body: SafeArea(
          bottom: false,
          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Hero(
                          tag: 'kite-logo',
                          child: SvgPicture.asset(
                            'assets/svg/kite_${Theme.of(context).brightness.name}.svg',
                            width: 32,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Kite',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () => Navigator.of(context).push(SettingsScreen.route()),
                          tooltip: 'Settings',
                        ),
                      ],
                    ),
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  scrolledUnderElevation: 0,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  toolbarHeight: 0,
                  bottom: TabBar(
                    isScrollable: true,
                    // controller: _tabController,
                    tabs: enabledCategories.map((category) => Tab(text: category.name)).toList(),
                  ),
                ),
              ];
            },
            body: TabBarView(
              // controller: _tabController,
              children: [
                for (final category in enabledCategories)
                  if (category.name == 'OnThisDay') const TodayInHistoryScreen() else _buildNewsFeed(ref, category),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewsFeed(WidgetRef ref, Category category) {
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
