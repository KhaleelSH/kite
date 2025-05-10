import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/core/ui/widget/generic_error.dart';
import 'package:kite/model/event.dart';
import 'package:kite/providers/news_provider.dart';
import 'package:kite/ui/today_in_history/widget/events_timeline_section.dart';

class TodayInHistoryScreen extends ConsumerStatefulWidget {
  const TodayInHistoryScreen({super.key});

  @override
  ConsumerState<TodayInHistoryScreen> createState() => _TodayInHistoryScreenState();
}

class _TodayInHistoryScreenState extends ConsumerState<TodayInHistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final eventsAsync = ref.watch(onThisDayProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Today in History'),
        bottom: TabBar(controller: _tabController, tabs: const [Tab(text: 'Events'), Tab(text: 'People')]),
      ),
      body: eventsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (error, _) => GenericError(exception: error),
        data: (events) {
          // Separate events by type
          final regularEvents = events.where((e) => e.type == EventType.event).toList();
          final peopleEvents = events.where((e) => e.type == EventType.people).toList();

          return TabBarView(
            controller: _tabController,
            children: [
              regularEvents.isEmpty
                  ? const Center(child: Text('No events available'))
                  : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: EventsTimelineSection(timeline: regularEvents),
                    ),
                  ),

              peopleEvents.isEmpty
                  ? const Center(child: Text('No people events available'))
                  : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: EventsTimelineSection(timeline: peopleEvents),
                    ),
                  ),
            ],
          );
        },
      ),
    );
  }
}
