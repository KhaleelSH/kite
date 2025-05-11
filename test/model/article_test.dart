import 'package:flutter_test/flutter_test.dart';
import 'package:kite/model/article.dart';

void main() {
  group('Article', () {
    test('fromJson creates correct instance', () {
      // Arrange
      final json = {
        'title': 'Test Article',
        'link': 'https://example.com/article',
        'domain': 'example.com',
        'date': '2023-05-15T10:30:00Z',
        'image': 'https://example.com/image.jpg',
        'image_caption': 'Test Image Caption',
      };

      // Act
      final article = Article.fromJson(json);

      // Assert
      expect(article.title, 'Test Article');
      expect(article.link, 'https://example.com/article');
      expect(article.domain, 'example.com');
      expect(article.date, DateTime.parse('2023-05-15T10:30:00Z'));
      expect(article.image, 'https://example.com/image.jpg');
      expect(article.imageCaption, 'Test Image Caption');
    });
  });
}
