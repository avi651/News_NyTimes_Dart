import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class ApiTestException implements Exception {
  final String message;
  final int? statusCode;

  ApiTestException(this.message, this.statusCode);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    if (other is ApiTestException) {
      return other.message == message && other.statusCode == statusCode;
    }

    return false;
  }
}

class DatabaseException implements Exception {}
