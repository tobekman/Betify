import 'package:betify_client/src/core/common/error_response.dart';

class AppException implements Exception {
  final ErrorResponse error;
  final String message;

  AppException({required this.error, required this.message});

  @override
  String toString() {
    return 'Status: ${error.status} - ${error.title}\n$message';
  }
}

class FetchDataException extends AppException {
  FetchDataException(error, message)
      : super(
          error: error,
          message: message,
        );
}

class BadRequestException extends AppException {
  BadRequestException(error, message)
      : super(
          error: error,
          message: message,
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException(error, message)
      : super(
          error: error,
          message: message,
        );
}

class InvalidInputException extends AppException {
  InvalidInputException(error, message)
      : super(
          error: error,
          message: message,
        );
}
