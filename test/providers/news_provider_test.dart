import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kite/data/news_data_provider.dart';
import 'package:kite/model/category.dart';
import 'package:kite/model/event.dart';
import 'package:kite/model/story.dart';
import 'package:kite/providers/news_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([NewsDataProvider])
import 'news_provider_test.mocks.dart';

void main() {
  group('NewsProviders', () {
    late MockNewsDataProvider mockNewsDataProvider;
    late ProviderContainer container;

    setUp(() {
      mockNewsDataProvider = MockNewsDataProvider();
      container = ProviderContainer(overrides: [newsDataProvider.overrideWithValue(mockNewsDataProvider)]);
      addTearDown(container.dispose);
    });

    group('categoriesProvider', () {
      test('returns categories from NewsDataProvider', () async {
        // Arrange
        final categories = [
          Category(name: 'Technology', file: 'technology.json'),
          Category(name: 'Business', file: 'business.json'),
        ];
        when(mockNewsDataProvider.getNewsCategories()).thenAnswer((_) async => categories);

        // Act
        final result = await container.read(categoriesProvider.future);

        // Assert
        expect(result, categories);
        verify(mockNewsDataProvider.getNewsCategories()).called(1);
      });

      test('throws exception when NewsDataProvider fails', () async {
        // Arrange
        when(mockNewsDataProvider.getNewsCategories()).thenThrow(Exception('Failed to load categories'));

        // Act & Assert
        expect(() => container.read(categoriesProvider.future), throwsA(isA<Exception>()));
      });
    });

    group('storiesProvider', () {
      test('returns stories for a specific category', () async {
        // Arrange
        final category = Category(name: 'Technology', file: 'technology.json');
        final stories = [
          Story(
            clusterNumber: 1,
            uniqueDomains: 5,
            numberOfTitles: 10,
            category: 'Technology',
            title: 'Test Story',
            shortSummary: 'A test story summary',
            perspectives: const [],
            didYouKnow: '',
            talkingPoints: const [],
            quote: '',
            quoteAuthor: '',
            quoteSourceUrl: '',
            quoteSourceDomain: '',
            location: '',
            emoji: '',
            geopoliticalContext: '',
            historicalBackground: '',
            internationalReactions: [],
            humanitarianImpact: '',
            economicImplications: '',
            timeline: [],
            futureOutlook: '',
            keyPlayers: [],
            technicalDetails: [],
            businessAngleText: '',
            businessAnglePoints: const [],
            userActionItems: const [],
            scientificSignificance: [],
            travelAdvisory: [],
            destinationHighlights: '',
            culinarySignificance: '',
            performanceStatistics: [],
            leagueStandings: '',
            diyTips: '',
            designPrinciples: '',
            userExperienceImpact: [],
            gameplayMechanics: [],
            industryImpact: [],
            technicalSpecifications: '',
            articles: [],
            domains: [],
          ),
        ];
        when(mockNewsDataProvider.getNewsStories(category)).thenAnswer((_) async => stories);

        // Act
        final result = await container.read(storiesProvider(category).future);

        // Assert
        expect(result, stories);
        verify(mockNewsDataProvider.getNewsStories(category)).called(1);
      });

      test('throws exception when NewsDataProvider fails', () async {
        // Arrange
        final category = Category(name: 'Technology', file: 'technology.json');
        when(mockNewsDataProvider.getNewsStories(category)).thenThrow(Exception('Failed to load stories'));

        // Act & Assert
        expect(() => container.read(storiesProvider(category).future), throwsA(isA<Exception>()));
      });
    });

    group('onThisDayProvider', () {
      test('returns events from NewsDataProvider', () async {
        // Arrange
        final events = [
          Event(year: '1969', content: 'Apollo 11 landed on the moon', sortYear: 1969.0, type: EventType.event),
          Event(year: '1879', content: 'Albert Einstein was born', sortYear: 1879.0, type: EventType.people),
        ];
        when(mockNewsDataProvider.getOnThisDayEvents()).thenAnswer((_) async => events);

        // Act
        final result = await container.read(onThisDayProvider.future);

        // Assert
        expect(result, events);
        verify(mockNewsDataProvider.getOnThisDayEvents()).called(1);
      });

      test('throws exception when NewsDataProvider fails', () async {
        // Arrange
        when(mockNewsDataProvider.getOnThisDayEvents()).thenThrow(Exception('Failed to load events'));

        // Act & Assert
        expect(() => container.read(onThisDayProvider.future), throwsA(isA<Exception>()));
      });
    });

    group('newsProvider', () {
      test('loads all data and completes successfully', () async {
        // Arrange
        final categories = [
          Category(name: 'Technology', file: 'technology.json'),
          Category(name: 'Business', file: 'business.json'),
        ];
        final stories = [
          Story(
            clusterNumber: 1,
            uniqueDomains: 5,
            numberOfTitles: 10,
            category: 'Technology',
            title: 'Test Story',
            shortSummary: 'A test story summary',
            perspectives: const [],
            didYouKnow: '',
            talkingPoints: const [],
            quote: '',
            quoteAuthor: '',
            quoteSourceUrl: '',
            quoteSourceDomain: '',
            location: '',
            emoji: '',
            geopoliticalContext: '',
            historicalBackground: '',
            internationalReactions: [],
            humanitarianImpact: '',
            economicImplications: '',
            timeline: [],
            futureOutlook: '',
            keyPlayers: [],
            technicalDetails: [],
            businessAngleText: '',
            businessAnglePoints: const [],
            userActionItems: const [],
            scientificSignificance: [],
            travelAdvisory: [],
            destinationHighlights: '',
            culinarySignificance: '',
            performanceStatistics: [],
            leagueStandings: '',
            diyTips: '',
            designPrinciples: '',
            userExperienceImpact: [],
            gameplayMechanics: [],
            industryImpact: [],
            technicalSpecifications: '',
            articles: [],
            domains: [],
          ),
        ];
        final events = [
          Event(year: '1969', content: 'Apollo 11 landed on the moon', sortYear: 1969.0, type: EventType.event),
        ];

        when(mockNewsDataProvider.getNewsCategories()).thenAnswer((_) async => categories);
        when(mockNewsDataProvider.getNewsStories(any)).thenAnswer((_) async => stories);
        when(mockNewsDataProvider.getOnThisDayEvents()).thenAnswer((_) async => events);

        // Act
        await container.read(newsProvider.future);

        // Assert
        verify(mockNewsDataProvider.getNewsCategories()).called(1);
        verify(mockNewsDataProvider.getNewsStories(any)).called(2);
        verify(mockNewsDataProvider.getOnThisDayEvents()).called(1);
      });
    });
  });
}
