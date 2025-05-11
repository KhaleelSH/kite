import 'package:flutter_test/flutter_test.dart';
import 'package:kite/model/category.dart';

void main() {
  group('Category', () {
    test('fromJson creates correct instance', () {
      // Arrange
      final json = {'name': 'Technology', 'file': 'tech.json'};

      // Act
      final category = Category.fromJson(json);

      // Assert
      expect(category.name, 'Technology');
      expect(category.file, 'tech.json');
    });
  });
}
