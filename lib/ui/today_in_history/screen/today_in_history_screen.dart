import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/core/ui/widget/generic_error.dart';
import 'package:kite/model/event.dart';
import 'package:kite/providers/news_provider.dart';
import 'package:kite/ui/today_in_history/widget/events_timeline_section.dart';

class TodayInHistoryScreen extends ConsumerWidget {
  const TodayInHistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final eventsAsync = ref.watch(onThisDayProvider);

    return Scaffold(
      body: eventsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator.adaptive()),
        error: (error, _) => GenericError(exception: error),
        data: (events) {
          // Separate events by type
          final regularEvents = events.where((e) => e.type == EventType.event).toList();
          final peopleEvents = events.where((e) => e.type == EventType.people).toList();

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Events Section
                    Text('Events', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    regularEvents.isEmpty
                        ? const Center(child: Text('No events available'))
                        : EventsTimelineSection(timeline: regularEvents),

                    const SizedBox(height: 32),

                    // People Section
                    Text('People', style: Theme.of(context).textTheme.titleLarge),
                    const SizedBox(height: 16),
                    peopleEvents.isEmpty
                        ? const Center(child: Text('No people events available'))
                        : EventsTimelineSection(timeline: peopleEvents),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
