import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kite/core/exception_handling/error_formatter.dart' as error_formatter;

void main() {
  group('ErrorFormatter', () {
    test('formats SocketException correctly', () {
      // Arrange
      final exception = SocketException('Failed to connect');

      // Act
      final result = error_formatter.ErrorFormatter.format(exception);

      // Assert
      expect(result, 'Please check your internet connection');
    });

    test('formats HttpException correctly', () {
      // Arrange
      final exception = HttpException('Not found');

      // Act
      final result = error_formatter.ErrorFormatter.format(exception);

      // Assert
      expect(result, 'Not found');
    });

    test('formats PlatformException with message correctly', () {
      // Arrange
      final exception = PlatformException(code: 'ERROR_CODE', message: 'Error message');

      // Act
      final result = error_formatter.ErrorFormatter.format(exception);

      // Assert
      expect(result, 'Error message');
    });

    test('formats PlatformException without message correctly', () {
      // Arrange
      final exception = PlatformException(code: 'ERROR_CODE');

      // Act
      final result = error_formatter.ErrorFormatter.format(exception);

      // Assert
      expect(result, 'ERROR_CODE');
    });

    test('formats other exceptions correctly', () {
      // Arrange
      final exception = Exception('Unknown error');

      // Act
      final result = error_formatter.ErrorFormatter.format(exception);

      // Assert
      expect(result, contains('Unexpected Exception'));
    });
  });
}
