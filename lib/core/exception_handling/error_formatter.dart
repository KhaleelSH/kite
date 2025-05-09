import 'dart:io';

import 'package:flutter/services.dart';

class ErrorFormatter {
  const ErrorFormatter._();

  static String format(Exception exception) {
    if (exception is SocketException) {
      return 'Please check your internet connection';
    }

    if (exception is HttpException) {
      return exception.message;
    }

    if (exception is PlatformException) {
      return exception.message ?? exception.code;
    }

    return 'Unexpected $exception';
  }
}
