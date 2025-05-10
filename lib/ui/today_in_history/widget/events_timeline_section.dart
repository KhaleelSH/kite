import 'package:flutter/material.dart';
import 'package:kite/model/event.dart';
import 'package:kite/ui/today_in_history/widget/html_widget_with_url_launcher.dart';

class EventsTimelineSection extends StatelessWidget {
  const EventsTimelineSection({super.key, required this.timeline});

  final List<Event> timeline;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final (index, event) in timeline.indexed)
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.translate(
                  offset: Offset(0, 8),
                  child: Column(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      if (index != timeline.length - 1)
                        Expanded(child: Container(width: 2, color: Theme.of(context).colorScheme.secondary)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  children: [
                    Text(
                      event.year,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      HtmlWidgetWithUrlLauncher(event.content),
                      if (index != timeline.length - 1) const SizedBox(height: 24),
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
