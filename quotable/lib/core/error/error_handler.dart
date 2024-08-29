import 'dart:io';
import 'package:dio/dio.dart';
import 'package:quotable/core/constant/constant.dart';

abstract class Failure {
  final DioExceptionType exceptionType;
  final int? statusCode;
  final String? message;
  const Failure({
    required this.exceptionType,
    this.statusCode,
    this.message,
  });
}

class ServerError extends Failure {
  ServerError({
    required super.exceptionType,
    super.statusCode,
    super.message,
  });

  factory ServerError.fromTimeout(DioException exception) {
    final type = exception.type;
    final statusCode = exception.response?.statusCode;
    switch (type) {
      case DioExceptionType.badResponse:
        return ServerError(
          exceptionType: DioExceptionType.cancel,
          statusCode: statusCode,
          message: _handleBadResponseExpMsg(statusCode ?? 404),
        );
      case DioExceptionType.badCertificate:
        return ServerError(
          exceptionType: DioExceptionType.cancel,
          statusCode: statusCode,
          message: badResponseError,
        );
      case DioExceptionType.receiveTimeout:
        return ServerError(
          exceptionType: DioExceptionType.receiveTimeout,
          statusCode: statusCode,
          message: receivingTimeout,
        );
      case DioExceptionType.sendTimeout:
        return ServerError(
          exceptionType: DioExceptionType.sendTimeout,
          statusCode: statusCode,
          message: sendingTimeout,
        );
      case DioExceptionType.connectionTimeout:
        return ServerError(
          exceptionType: DioExceptionType.connectionTimeout,
          statusCode: statusCode,
          message: connectionTimeout,
        );
      case DioExceptionType.cancel:
        return ServerError(
          exceptionType: DioExceptionType.cancel,
          statusCode: statusCode,
          message: cancelError,
        );
      case DioExceptionType.connectionError:
        return ServerError(
          exceptionType: DioExceptionType.cancel,
          statusCode: statusCode,
          message: noInternetError,
        );

      default:
        return ServerError(
          exceptionType: DioExceptionType.cancel,
          statusCode: statusCode,
          message: defaultError,
        );
    }
  }

  static String _handleBadResponseExpMsg(int statusCode) {
    final String message;
    if (statusCode >= 100 && statusCode < 200) {
      message =
          'This is an informational response - the request was received, continuing processing';
    } else if (statusCode >= 200 && statusCode < 300) {
      message =
          'The request was successfully received, understood, and accepted';
    } else if (statusCode >= 300 && statusCode < 400) {
      message =
          'Redirection: further action needs to be taken in order to complete the request';
    } else if (statusCode >= 400 && statusCode < 500) {
      message =
          'Client error - the request contains bad syntax or cannot be fulfilled';
    } else if (statusCode >= 500 && statusCode < 600) {
      message =
          'Server error - the server failed to fulfil an apparently valid request';
    } else {
      message =
          'A response with a status code that is not within the range of inclusive 100 to exclusive 600'
          'is a non-standard response, possibly due to the server\'s software';
    }
    return message;
  }
}
