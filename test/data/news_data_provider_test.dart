import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:kite/core/data/remote/kite_http_client.dart';
import 'package:kite/data/news_data_provider.dart';
import 'package:kite/model/category.dart';
import 'package:kite/model/event.dart';
import 'package:kite/model/story.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateMocks([KiteHttpClient])
import 'news_data_provider_test.mocks.dart';

void main() {
  group('NewsDataProvider', () {
    late MockKiteHttpClient mockHttpClient;
    late NewsDataProvider newsDataProvider;
    late Map<String, dynamic> storiesJson;

    setUp(() {
      mockHttpClient = MockKiteHttpClient();
      newsDataProvider = NewsDataProvider(mockHttpClient);
      storiesJson = {
        'category': 'Technology',
        'timestamp': 1746965896,
        'read': 674,
        'clusters': [
          {
            'cluster_number': 1,
            'unique_domains': 7,
            'number_of_titles': 7,
            'category': 'Privacy',
            'title': r'Google pays $1.4 billion to settle Texas privacy lawsuit',
            'short_summary':
                r"Google has agreed to pay $1.375 billion to the state of Texas to settle two lawsuits alleging the company violated users' privacy rights. Texas Attorney General Ken Paxton accused Google of collecting biometric data including facial geometry and voiceprints without proper consent, as well as tracking users' locations even when they had disabled the feature. Google denied any wrongdoing while agreeing to the landmark settlement.",
            'did_you_know':
                r'This $1.375 billion settlement is the largest amount any U.S. state has recovered from Google for privacy violations, far exceeding previous settlements which have typically been under $100 million.',
            'talking_points': [
              r'Record settlement: The $1.375 billion payment represents the largest privacy violation settlement Google has ever paid to a single state.',
              'No product changes: Despite the massive payout, the settlement does not require Google to make any new changes to its products or services.',
              'Biometric collection: Texas specifically alleged Google violated privacy by scanning faces in Google Photos and collecting voiceprints through Google Assistant without proper consent.',
              r'Similar Meta case: Earlier in July 2024, Meta also agreed to pay Texas $1.4 billion to settle similar allegations about collecting facial recognition data without consent.',
            ],
            'quote':
                "\"In Texas, Big Tech is not above the law. For years, Google secretly tracked people's movements, private searches, and even their voiceprints and facial geometry through their products and services. I fought back and won.\"",
            'quote_author': 'Ken Paxton, Texas Attorney General',
            'quote_source_url':
                'https://techcrunch.com/2025/05/10/google-will-pay-texas-1-4-billion-to-settle-privacy-lawsuits/',
            'quote_source_domain': 'techcrunch.com',
            'location': 'Austin, TX, United States',
            'perspectives': [
              {
                'text':
                    "Texas Attorney General: Claims Google violated user privacy by secretly collecting biometric data and location information without proper consent, calling the settlement \"a major win for Texans' privacy.\".",
                'sources': [
                  {
                    'name': 'TechJuice',
                    'url': 'https://www.techjuice.pk/google-to-pay-texas-1-4b-in-landmark-privacy-deal/',
                  },
                ],
              },
              {
                'text':
                    'Google: Denies any wrongdoing while agreeing to settle, stating these were "old claims" about "product policies we have long since changed," suggesting the company has already addressed the issues.',
                'sources': [
                  {
                    'name': 'Engadget',
                    'url':
                        'https://www.engadget.com/big-tech/google-will-pay-texas-14-billion-to-settle-data-privacy-violation-lawsuits-120044844.html',
                  },
                ],
              },
            ],
            'emoji': 'ðŸ’°',
            'geopolitical_context': '',
            'historical_background':
                "The Texas lawsuits against Google were filed in 2022, focusing on alleged data collection practices including tracking users' locations and collecting biometric data without explicit permission. This case follows a broader trend of increasing legal scrutiny over tech companies' data collection practices and privacy policies in recent years.",
            'international_reactions': '',
            'humanitarian_impact': '',
            'economic_implications': '',
            'timeline': '',
            'future_outlook': '',
            'key_players': [],
            'technical_details': '',
            'business_angle_text': '',
            'business_angle_points': [
              r"Settlement impact: While $1.4 billion is a significant sum, it represents less than 1% of Google's annual revenue, suggesting the financial impact will be manageable for the company.",
              'Regulatory risk: This settlement signals increasing regulatory scrutiny of data collection practices, representing a growing business risk for companies that rely heavily on user data.',
              'No operational changes: The settlement requiring no product changes indicates Google has likely already adjusted its practices, reducing the likelihood of similar future violations and associated costs.',
            ],
            'user_action_items': [
              'Privacy settings review: Check your Google account privacy settings at myaccount.google.com to control what data is collected.',
              'Biometric data: Consider reviewing how your photos and voice data are used in Google Photos and Assistant.',
              'Location tracking: Verify your location history settings and disable them if you prefer not to have your movements tracked.',
            ],
            'scientific_significance': [],
            'travel_advisory': [],
            'destination_highlights': '',
            'culinary_significance': '',
            'performance_statistics': [],
            'league_standings': '',
            'diy_tips': '',
            'design_principles': '',
            'user_experience_impact': '',
            'gameplay_mechanics': [],
            'industry_impact': [
              'Legal precedent: The unprecedented size of this settlement may encourage other states to pursue similar cases against tech companies over privacy violations.',
              'Privacy standards: This settlement highlights the financial consequences companies may face for privacy violations, potentially influencing future data collection practices across the tech industry.',
              'Consumer awareness: The high-profile nature of this case draws attention to how tech companies collect and use personal data, potentially raising user awareness about privacy concerns.',
            ],
            'technical_specifications': '',
            'articles': [
              {
                'title': r'Google to pay $1.38b to settle Texas privacy claims',
                'link': 'https://www.techinasia.com/news/google-to-pay-1-38b-to-settle-texas-privacy-claims',
                'domain': 'techinasia.com',
                'date': '2025-05-11T02:30:36+00:00',
                'image':
                    'https://kagiproxy.com/img/EKdomX4sKBQ9IIm9xL5SNEpvaa__DgOAAndPkOlm1Hspi27vaanNwd2Bj3F80Zc_B271xIi-Kp8LMCLSBbSwz5TUeN5YpEG7MZh5NJhMd8qE8SQC8Iy3lMPH4Hlnh5lGHpcWxvSRDoLrIYzJYPRKd1hH93n3TGsaypWCvsBzag',
                'image_caption': '',
              },
              {
                'title': r'Google coughs up $1.4 billion to Texas over privacy lawsuit',
                'link': 'https://mashable.com/article/google-texas-1-billion-privacy-lawsuit',
                'domain': 'mashable.com',
                'date': '2025-05-10T15:15:11+00:00',
                'image':
                    'https://kagiproxy.com/img/gIZNTJLtNi9YQdXrFdvGhrqYYCvu-8DRUtYDvi3TvlUglmYUbeoAb0rvCiI75uE9-kFhxw8GKLxc7D-gVRphl8fTnmdbFxDRgRzABTS5RsMnOSwnKCpzF-uDMCeDxk32h5HW3haI8nM1IhbQFsiRoZg',
                'image_caption': 'google logo on screen',
              },
              {
                'title': r'Google to Pay Texas $1.4B in Landmark Privacy Deal',
                'link': 'https://www.techjuice.pk/google-to-pay-texas-1-4b-in-landmark-privacy-deal/',
                'domain': 'techjuice.pk',
                'date': '2025-05-11T08:13:43+00:00',
                'image': '',
                'image_caption': '',
              },
              {
                'title':
                    r'Google Will Pay $1.4 Billion to Texas to Settle Claims It Collected User Data Without Permission',
                'link':
                    'https://tech.slashdot.org/story/25/05/10/0430217/google-will-pay-14-billion-to-texas-to-settle-claims-it-collected-user-data-without-permission',
                'domain': 'slashdot.org',
                'date': '2025-05-10T14:34:00+00:00',
                'image': '',
                'image_caption': '',
              },
              {
                'title': r"Google settles Black employees' racial bias lawsuit for $50 million",
                'link': 'https://www.reddit.com/r/google/comments/1kjdehu/google_settles_black_employees_racial_bias/',
                'domain': 'reddit.com',
                'date': '2025-05-10T15:51:00+00:00',
                'image': '',
                'image_caption': '',
              },
              {
                'title': r'Google will pay Texas $1.4 billion to settle privacy lawsuits',
                'link':
                    'https://techcrunch.com/2025/05/10/google-will-pay-texas-1-4-billion-to-settle-privacy-lawsuits/',
                'domain': 'techcrunch.com',
                'date': '2025-05-10T16:30:32+00:00',
                'image': '',
                'image_caption': '',
              },
              {
                'title': r'Google will pay Texas $1.4 billion to settle data privacy violation lawsuits',
                'link':
                    'https://www.engadget.com/big-tech/google-will-pay-texas-14-billion-to-settle-data-privacy-violation-lawsuits-120044844.html',
                'domain': 'engadget.com',
                'date': '2025-05-10T12:00:44+00:00',
                'image': '',
                'image_caption': '',
              },
            ],
            'domains': [
              {
                'name': 'engadget.com',
                'favicon':
                    'https://kagiproxy.com/img/md933iUQq2Vjc66J3O1GkI_qaeCDRJPC6sP5_3HzUf9DsP_m0SI9VYEt8VcV_v6k8LabXQ3By6z4IiLhQXMlZFFwtc3E_SKvg4khvcuFUBorDg',
              },
              {
                'name': 'mashable.com',
                'favicon':
                    'https://kagiproxy.com/img/vzt0okFXdxfwvpaNxMSTy3mF9-VKMjqwDmCvpluKwvNGtzhVMJTUYC3ABUJ5R52z89IgRowR0xti6XGaKqlBazH_9KDOnazQc9j3azZBjgWYBg',
              },
              {
                'name': 'techinasia.com',
                'favicon':
                    'https://kagiproxy.com/img/-mdG7agz6hEkXsWie2X6k_ulqb2jVaRTM6fpGsqrJLC2zqoec-OFC3zYpfTyEQV6-Sg7xzI47SD0IEMTFKTSQSHke-z0OnUBWAjowofhXnkpmklR',
              },
              {
                'name': 'techjuice.pk',
                'favicon':
                    'https://kagiproxy.com/img/eqTeh6hmW49FDlzhrpbj8w4pa2sOs6gFIFDzAGWtWilkLXS_Ci_nnt3zhiic0VkKpRp5Q-Tz5S6wKsWeneKtca-MSE6N4kf1XPV_UoO50VP4Qw',
              },
              {
                'name': 'slashdot.org',
                'favicon':
                    'https://kagiproxy.com/img/MHB5w4GE6YShjEpq9IEv2Fvyc_6OT5b-Ndo7bvL4JPnS2bnqtWjeftpUSgWmielClB-dFfYVp-XchVtpTh6xNo1VO9WJuk2CWmHQHfVqUqO9pw',
              },
              {
                'name': 'techcrunch.com',
                'favicon':
                    'https://kagiproxy.com/img/Houe18prPuSwkDFEYR_dpaRUKxqux1MYih-YGx-QJbJ9TiN_ojtzrl3nN0fIco4MfO-c-fB-d41F2oixZqZbFWf3PCmJ156nLN7d_pgWgnv6ZVEA',
              },
              {
                'name': 'reddit.com',
                'favicon':
                    'https://kagiproxy.com/img/7X0ZZBrjrX27q859om7p1aBhGhGB8wqqqT0zBK5Dtshq-SJ9wI6-rlx7My0rN9svs1ZClzVgUQa1r8j4EtIRVpAhG_sxKl1kehTsFaqHZ28',
              },
            ],
          },
        ],
      };
    });

    group('getNewsCategories', () {
      test('returns list of categories when http call succeeds', () async {
        // Arrange
        final categoriesJson = {
          'timestamp': 1746968667,
          'categories': [
            {'name': 'World', 'file': 'world.json'},
            {'name': 'USA', 'file': 'usa.json'},
          ],
        };

        when(mockHttpClient.get('kite.json')).thenAnswer((_) async => http.Response(json.encode(categoriesJson), 200));

        // Act
        final categories = await newsDataProvider.getNewsCategories();

        // Assert
        expect(categories, isA<List<Category>>());
        expect(categories.length, 2);
        expect(categories[0].name, 'World');
        expect(categories[0].file, 'world.json');
        expect(categories[1].name, 'USA');
        expect(categories[1].file, 'usa.json');
      });

      test('throws exception when http call fails', () async {
        // Arrange
        when(mockHttpClient.get('kite.json')).thenAnswer((_) async => http.Response('Not found', 404));

        // Act & Assert
        expect(() => newsDataProvider.getNewsCategories(), throwsA(isA<HttpException>()));
      });
    });

    group('getNewsStories', () {
      test('returns list of stories when http call succeeds', () async {
        // Arrange
        final category = Category(name: 'Technology', file: 'tech.json');

        when(mockHttpClient.get('tech.json')).thenAnswer(
          (_) async => http.Response(
            json.encode(storiesJson),
            200,
            headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
          ),
        );

        // Act
        final stories = await newsDataProvider.getNewsStories(category);

        // Assert
        expect(stories, isA<List<Story>>());
        expect(stories.length, 1);
        expect(stories[0].title, 'Google pays \$1.4 billion to settle Texas privacy lawsuit');
        expect(
          stories[0].shortSummary,
          'Google has agreed to pay \$1.375 billion to the state of Texas to settle two lawsuits alleging the company violated users\' privacy rights. Texas Attorney General Ken Paxton accused Google of collecting biometric data including facial geometry and voiceprints without proper consent, as well as tracking users\' locations even when they had disabled the feature. Google denied any wrongdoing while agreeing to the landmark settlement.',
        );
      });

      test('empty string is parsed into empty list for list types', () async {
        // Arrange
        final category = Category(name: 'Technology', file: 'tech.json');

        when(mockHttpClient.get('tech.json')).thenAnswer(
          (_) async => http.Response(
            json.encode(storiesJson),
            200,
            headers: {HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'},
          ),
        );

        // Act
        final stories = await newsDataProvider.getNewsStories(category);

        // Assert
        expect(stories[0].internationalReactions, []);
        expect(stories[0].timeline, []);
      });

      test('throws exception when http call fails', () async {
        // Arrange
        final category = Category(name: 'Technology', file: 'tech.json');
        when(mockHttpClient.get('tech.json')).thenAnswer((_) async => http.Response('Not found', 404));

        // Act & Assert
        expect(() => newsDataProvider.getNewsStories(category), throwsA(isA<HttpException>()));
      });
    });

    group('getOnThisDayEvents', () {
      test('returns list of events when http call succeeds', () async {
        // Arrange
        final eventsJson = {
          'timestamp': 1746964952,
          'events': [
            {'year': '2022', 'content': 'Event 1', 'sort_year': 2022, 'type': 'event'},
            {'year': '2001', 'content': r'People 1', 'sort_year': 2001.2, 'type': 'people'},
          ],
        };

        when(mockHttpClient.get('onthisday.json')).thenAnswer((_) async => http.Response(json.encode(eventsJson), 200));

        // Act
        final events = await newsDataProvider.getOnThisDayEvents();

        // Assert
        expect(events, isA<List<Event>>());
        expect(events.length, 2);
        expect(events[0].year, '2022');
        expect(events[0].content, 'Event 1');
        expect(events[0].type, EventType.event);
        expect(events[1].year, '2001');
        expect(events[1].content, 'People 1');
        expect(events[1].type, EventType.people);
      });

      test('throws exception when http call fails', () async {
        // Arrange
        when(mockHttpClient.get('onthisday.json')).thenAnswer((_) async => http.Response('Not found', 404));

        // Act & Assert
        expect(() => newsDataProvider.getOnThisDayEvents(), throwsA(isA<HttpException>()));
      });
    });
  });
}
