// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Story _$StoryFromJson(Map<String, dynamic> json) => Story(
  clusterNumber: (json['cluster_number'] as num).toInt(),
  uniqueDomains: (json['unique_domains'] as num).toInt(),
  numberOfTitles: (json['number_of_titles'] as num).toInt(),
  category: json['category'] as String,
  title: json['title'] as String,
  shortSummary: json['short_summary'] as String,
  didYouKnow: json['did_you_know'] as String,
  talkingPoints:
      (json['talking_points'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
  quote: json['quote'] as String,
  quoteAuthor: json['quote_author'] as String,
  quoteSourceUrl: json['quote_source_url'] as String,
  quoteSourceDomain: json['quote_source_domain'] as String,
  location: json['location'] as String,
  perspectives:
      (json['perspectives'] as List<dynamic>)
          .map((e) => Perspective.fromJson(e as Map<String, dynamic>))
          .toList(),
  emoji: json['emoji'] as String,
  geopoliticalContext: json['geopolitical_context'] as String,
  historicalBackground: json['historical_background'] as String,
  internationalReactions: const EmptyStringToListJsonConverter().fromJson(
    json['international_reactions'],
  ),
  humanitarianImpact: json['humanitarian_impact'] as String,
  economicImplications: json['economic_implications'] as String,
  timeline: const EmptyStringToListJsonConverter().fromJson(json['timeline']),
  futureOutlook: json['future_outlook'] as String,
  keyPlayers: json['key_players'] as List<dynamic>,
  technicalDetails: const EmptyStringToListJsonConverter().fromJson(
    json['technical_details'],
  ),
  businessAngleText: json['business_angle_text'] as String,
  businessAnglePoints: const EmptyStringToListJsonConverter().fromJson(
    json['business_angle_points'],
  ),
  userActionItems: const EmptyStringToListJsonConverter().fromJson(
    json['user_action_items'],
  ),
  scientificSignificance: const EmptyStringToListJsonConverter().fromJson(
    json['scientific_significance'],
  ),
  travelAdvisory: const EmptyStringToListJsonConverter().fromJson(
    json['travel_advisory'],
  ),
  destinationHighlights: json['destination_highlights'] as String,
  culinarySignificance: json['culinary_significance'] as String,
  performanceStatistics: const EmptyStringToListJsonConverter().fromJson(
    json['performance_statistics'],
  ),
  leagueStandings: json['league_standings'] as String,
  diyTips: json['diy_tips'] as String,
  designPrinciples: json['design_principles'] as String,
  userExperienceImpact: const EmptyStringToListJsonConverter().fromJson(
    json['user_experience_impact'],
  ),
  gameplayMechanics: const EmptyStringToListJsonConverter().fromJson(
    json['gameplay_mechanics'],
  ),
  industryImpact: const EmptyStringToListJsonConverter().fromJson(
    json['industry_impact'],
  ),
  technicalSpecifications: json['technical_specifications'] as String,
  articles:
      (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
  domains:
      (json['domains'] as List<dynamic>)
          .map((e) => Domain.fromJson(e as Map<String, dynamic>))
          .toList(),
);
