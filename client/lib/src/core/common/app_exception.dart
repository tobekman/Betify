import 'package:betify_client/src/core/common/error_response.dart';

class AppException implements Exception {
  final ErrorResponse error;

  AppException({required this.error});

  @override
  String toString() {
    return 'Status: ${error.status} - ${error.title}';
  }
}

class FetchDataException extends AppException {
  FetchDataException(error) : super(error: error);
}

class BadRequestException extends AppException {
  BadRequestException(error) : super(error: error);
}

class UnauthorisedException extends AppException {
  UnauthorisedException(error) : super(error: error);
}

class InvalidInputException extends AppException {
  InvalidInputException(error) : super(error: error);
}
