import 'package:json_annotation/json_annotation.dart';
import 'package:kite/data/empty_string_to_list_json_converter.dart';
import 'package:kite/model/article.dart';
import 'package:kite/model/domain.dart';
import 'package:kite/model/perspective.dart';

part 'story.g.dart';

@JsonSerializable()
class Story {
  const Story({
    required this.clusterNumber,
    required this.uniqueDomains,
    required this.numberOfTitles,
    required this.category,
    required this.title,
    required this.shortSummary,
    required this.didYouKnow,
    required this.talkingPoints,
    required this.quote,
    required this.quoteAuthor,
    required this.quoteSourceUrl,
    required this.quoteSourceDomain,
    required this.location,
    required this.perspectives,
    required this.emoji,
    required this.geopoliticalContext,
    required this.historicalBackground,
    required this.internationalReactions,
    required this.humanitarianImpact,
    required this.economicImplications,
    required this.timeline,
    required this.futureOutlook,
    required this.keyPlayers,
    required this.technicalDetails,
    required this.businessAngleText,
    required this.businessAnglePoints,
    required this.userActionItems,
    required this.scientificSignificance,
    required this.travelAdvisory,
    required this.destinationHighlights,
    required this.culinarySignificance,
    required this.performanceStatistics,
    required this.leagueStandings,
    required this.diyTips,
    required this.designPrinciples,
    required this.userExperienceImpact,
    required this.gameplayMechanics,
    required this.industryImpact,
    required this.technicalSpecifications,
    required this.articles,
    required this.domains,
  });

  final int clusterNumber;
  final int uniqueDomains;
  final int numberOfTitles;
  final String category;
  final String title;
  final String shortSummary;
  final String didYouKnow;
  final List<String> talkingPoints;
  final String quote;
  final String quoteAuthor;
  final String quoteSourceUrl;
  final String quoteSourceDomain;
  final String location;
  final List<Perspective> perspectives;
  final String emoji;

  // TODO: Check the correctness of the types below this line
  final String geopoliticalContext;
  final String historicalBackground;
  @EmptyStringToListJsonConverter()
  final List<String> internationalReactions;
  final String humanitarianImpact;
  final String economicImplications;
  @EmptyStringToListJsonConverter()
  final List<String> timeline;
  final String futureOutlook;
  final List keyPlayers;
  @EmptyStringToListJsonConverter()
  final List<String> technicalDetails;
  final String businessAngleText;
  @EmptyStringToListJsonConverter()
  final List<String> businessAnglePoints;
  @EmptyStringToListJsonConverter()
  final List<String> userActionItems;
  @EmptyStringToListJsonConverter()
  final List<String> scientificSignificance;
  @EmptyStringToListJsonConverter()
  final List<String> travelAdvisory;
  final String destinationHighlights;
  final String culinarySignificance;
  @EmptyStringToListJsonConverter()
  final List<String> performanceStatistics;
  final String leagueStandings;
  final String diyTips;
  final String designPrinciples;
  @EmptyStringToListJsonConverter()
  final List<String> userExperienceImpact;
  @EmptyStringToListJsonConverter()
  final List<String> gameplayMechanics;
  @EmptyStringToListJsonConverter()
  final List<String> industryImpact;
  final String technicalSpecifications;
  final List<Article> articles;
  final List<Domain> domains;

  factory Story.fromJson(Map<String, dynamic> json) => _$StoryFromJson(json);
}

List<String> stringListFromJson(List<dynamic> json) {
  return json.map((e) => e.toString()).toList();
}
