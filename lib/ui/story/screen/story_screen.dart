import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kite/model/article.dart';
import 'package:kite/model/story.dart';
import 'package:kite/ui/story/widget/story_action_items_section.dart';
import 'package:kite/ui/story/widget/story_article_image_section.dart';
import 'package:kite/ui/story/widget/story_business_angle_section.dart';
import 'package:kite/ui/story/widget/story_did_you_know_section.dart';
import 'package:kite/ui/story/widget/story_events_timeline_section.dart';
import 'package:kite/ui/story/widget/story_header_section.dart';
import 'package:kite/ui/story/widget/story_highlights_section.dart';
import 'package:kite/ui/story/widget/story_international_reactions_section.dart';
import 'package:kite/ui/story/widget/story_perspectives_section.dart';
import 'package:kite/ui/story/widget/story_quote_section.dart';
import 'package:kite/ui/story/widget/story_sources_section.dart';
import 'package:kite/ui/story/widget/story_text_list_section.dart';
import 'package:kite/ui/story/widget/story_text_section.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryScreen extends ConsumerWidget {
  const StoryScreen({super.key, required this.story});

  final Story story;

  static Route<void> route({required Story story}) {
    return MaterialPageRoute(builder: (_) => StoryScreen(story: story));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the first article with an image if available
    final mainArticle = story.articles.firstWhereOrNull((article) => article.image.isNotEmpty);

    // Get the second article with an image if available
    final secondaryArticle = story.articles.where((a) => a.image.isNotEmpty).skip(1).cast<Article?>().firstOrNull;

    return Scaffold(
      body: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: mainArticle != null ? MediaQuery.sizeOf(context).height / 3 : null,
              pinned: true,
              stretch: true,
              backgroundColor: Theme.of(context).colorScheme.surface,
              foregroundColor: Theme.of(context).colorScheme.onSurface,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const [StretchMode.zoomBackground, StretchMode.blurBackground],
                background: mainArticle != null ? StoryHeaderSection(mainArticle: mainArticle) : null,
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      story.title,
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                    ),

                    // Category and Location
                    Row(
                      children: [
                        if (story.category.isNotEmpty) ...[
                          Text(
                            story.category,
                            style: Theme.of(
                              context,
                            ).textTheme.titleSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
                          ),
                        ],
                        if (story.category.isNotEmpty && story.location.isNotEmpty) ...[
                          SizedBox(width: 16),
                          SizedBox(height: 16, child: VerticalDivider()),
                        ],
                        if (story.location.isNotEmpty) ...[
                          Flexible(
                            child: TextButton.icon(
                              onPressed: () => _openMap(story.location),
                              style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
                              icon: Icon(Icons.location_on_rounded),
                              label: Text(story.location, overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ],
                    ),

                    // Short Summary
                    if (story.shortSummary.isNotEmpty) ...[Text(story.shortSummary), const SizedBox(height: 24)],

                    // Talking Points
                    if (story.talkingPoints.isNotEmpty) ...[
                      StoryHighlightsSection(talkingPoints: story.talkingPoints),
                      const SizedBox(height: 24),
                    ],

                    // Quote
                    if (story.quote.isNotEmpty) ...[
                      StoryQuoteSection(
                        quote: story.quote,
                        quoteAuthor: story.quoteAuthor,
                        quoteSourceUrl: story.quoteSourceUrl,
                        quoteSourceDomain: story.quoteSourceDomain,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Secondary Article Image
                    if (secondaryArticle != null) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: StoryArticleImageSection(article: secondaryArticle),
                      ),
                      const SizedBox(height: 24),
                    ],

                    // Perspectives
                    if (story.perspectives.isNotEmpty) ...[
                      StoryPerspectivesSection(perspectives: story.perspectives),
                      const SizedBox(height: 24),
                    ],

                    // Historical Background
                    if (story.historicalBackground.isNotEmpty) ...[
                      StoryTextSection(title: 'Historical background', content: story.historicalBackground),
                      const SizedBox(height: 24),
                    ],

                    // Humanitarian Impact
                    if (story.humanitarianImpact.isNotEmpty) ...[
                      StoryTextSection(title: 'Humanitarian impact', content: story.humanitarianImpact),
                      const SizedBox(height: 24),
                    ],

                    // Technical details
                    if (story.technicalDetails.isNotEmpty) ...[
                      StoryTextListSection(title: 'Technical details', content: story.technicalDetails),
                      const SizedBox(height: 24),
                    ],

                    // Business angle
                    if (story.businessAngleText.isNotEmpty || story.businessAnglePoints.isNotEmpty) ...[
                      StoryBusinessAngleSection(
                        businessAngleText: story.businessAngleText,
                        businessAnglePoints: story.businessAnglePoints,
                      ),
                      const SizedBox(height: 24),
                    ],

                    // International reactions
                    if (story.internationalReactions.isNotEmpty) ...[
                      StoryInternationalReactionsSection(internationalReactions: story.internationalReactions),
                      const SizedBox(height: 24),
                    ],

                    // Other details
                    if (story.geopoliticalContext.isNotEmpty) ...[
                      StoryTextSection(title: 'Geopolitical context', content: story.geopoliticalContext),
                      const SizedBox(height: 24),
                    ],

                    if (story.economicImplications.isNotEmpty) ...[
                      StoryTextSection(title: 'Economic implications', content: story.economicImplications),
                      const SizedBox(height: 24),
                    ],

                    if (story.futureOutlook.isNotEmpty) ...[
                      StoryTextSection(title: 'Future outlook', content: story.futureOutlook),
                      const SizedBox(height: 24),
                    ],

                    if (story.scientificSignificance.isNotEmpty) ...[
                      StoryTextListSection(title: 'Scientific significance', content: story.scientificSignificance),
                      const SizedBox(height: 24),
                    ],

                    if (story.travelAdvisory.isNotEmpty) ...[
                      StoryTextListSection(title: 'Travel advisory', content: story.travelAdvisory),
                      const SizedBox(height: 24),
                    ],

                    if (story.destinationHighlights.isNotEmpty) ...[
                      StoryTextSection(title: 'Destination highlights', content: story.destinationHighlights),
                      const SizedBox(height: 24),
                    ],

                    if (story.culinarySignificance.isNotEmpty) ...[
                      StoryTextSection(title: 'Culinary significance', content: story.culinarySignificance),
                      const SizedBox(height: 24),
                    ],

                    if (story.diyTips.isNotEmpty) ...[
                      StoryTextSection(title: 'DIY tips', content: story.diyTips),
                      const SizedBox(height: 24),
                    ],

                    if (story.designPrinciples.isNotEmpty) ...[
                      StoryTextSection(title: 'Technical specifications', content: story.technicalSpecifications),
                      const SizedBox(height: 24),
                    ],

                    if (story.industryImpact.isNotEmpty) ...[
                      StoryTextListSection(title: 'Industry impact', content: story.industryImpact),
                      const SizedBox(height: 24),
                    ],

                    if (story.technicalSpecifications.isNotEmpty) ...[
                      StoryTextSection(title: 'Technical specifications', content: story.technicalSpecifications),
                      const SizedBox(height: 24),
                    ],

                    if (story.userExperienceImpact.isNotEmpty) ...[
                      StoryTextListSection(title: 'User experience impact', content: story.userExperienceImpact),
                      const SizedBox(height: 24),
                    ],

                    if (story.gameplayMechanics.isNotEmpty) ...[
                      StoryTextListSection(title: 'Gameplay mechanics', content: story.gameplayMechanics),
                      const SizedBox(height: 24),
                    ],

                    if (story.performanceStatistics.isNotEmpty) ...[
                      StoryTextListSection(title: 'Performance statistics', content: story.performanceStatistics),
                      const SizedBox(height: 24),
                    ],

                    if (story.leagueStandings.isNotEmpty) ...[
                      StoryTextSection(title: 'League standings', content: story.leagueStandings),
                      const SizedBox(height: 24),
                    ],

                    // Timeline of events
                    if (story.timeline.isNotEmpty) ...[
                      StoryEventsTimelineSection(timeline: story.timeline),
                      const SizedBox(height: 24),
                    ],

                    // Sources
                    if (story.domains.isNotEmpty) ...[
                      StorySourcesSection(articles: story.articles, domains: story.domains),
                      const SizedBox(height: 24),
                    ],

                    // Action Items
                    if (story.userActionItems.isNotEmpty) ...[
                      StoryActionItemsSection(userActionItems: story.userActionItems),
                      const SizedBox(height: 24),
                    ],

                    // Did you know?
                    if (story.didYouKnow.isNotEmpty) ...[
                      StoryDidYouKnowSection(didYouKnow: story.didYouKnow),
                      const SizedBox(height: 24),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _openMap(String address) async {
    final encoded = Uri.encodeComponent(address);

    Uri? uri;
    if (Platform.isAndroid) {
      uri = Uri.parse('geo:0,0?q=$encoded');
    } else if (Platform.isIOS) {
      final googleUri = Uri.parse('comgooglemaps://?q=$encoded');
      if (await canLaunchUrl(googleUri)) {
        uri = googleUri;
      } else {
        uri = Uri.parse('https://maps.apple.com/?q=$encoded');
      }
    }

    if (uri != null && await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
