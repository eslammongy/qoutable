import 'package:dio/dio.dart';
import 'package:quotable/core/constant/constant.dart';

class Failure {
  int code; // 200, 201, 400, 303..500 and so on
  String message; // error , success

  Failure(this.code, this.message);
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else {
      // default error
      failure = DataSource.defaultError.getFailure();
    }
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectionTimeout.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(error.response?.statusCode ?? 0,
            error.response?.data["message"] ?? "");
      } else {
        return DataSource.defaultError.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.cancel.getFailure();
    default:
      return DataSource.defaultError.getFailure();
  }
}

enum DataSource {
  /// the request was successful
  success,

  /// the requested resource could not be found but may be available in the future
  noContent,

  /// the server cannot or will not process the request due to a client error
  badRequest,

  /// the request is being rejected due to the user not having the necessary permissions
  forbidden,

  /// the request is being rejected due to the user not being authenticated
  unauthorised,

  /// the requested resource could not be found
  notFound,

  /// unexpected condition was encountered and no more specific message is suitable
  internalServerError,

  /// the connection to the API timed out
  connectionTimeout,

  /// the request was cancelled
  cancel,

  /// receiving data from the API timed out
  receiveTimeout,

  /// sending data to the API timed out
  sendTimeout,

  /// the request could not be completed due to a cache error
  cacheError,

  /// the internet connection is not available
  noInternetConnection,

  /// default error
  defaultError
}



extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(ResponseCode.success, ResponseMessage.SUCCESS);
      case DataSource.noContent:
        return Failure(ResponseCode.noContent, ResponseMessage.NO_CONTENT);
      case DataSource.badRequest:
        return Failure(ResponseCode.badRequest, ResponseMessage.BAD_REQUEST);
      case DataSource.forbidden:
        return Failure(ResponseCode.forbidden, ResponseMessage.FORBIDDEN);
      case DataSource.unauthorised:
        return Failure(ResponseCode.unauthorised, ResponseMessage.UNAUTHORISED);
      case DataSource.notFound:
        return Failure(ResponseCode.notFound, ResponseMessage.NOT_FOUND);
      case DataSource.internalServerError:
        return Failure(ResponseCode.internalServerError,
            ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.connectionTimeout:
        return Failure(
            ResponseCode.connectTimeout, ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.cancel:
        return Failure(ResponseCode.cancel, ResponseMessage.CANCEL);
      case DataSource.receiveTimeout:
        return Failure(
            ResponseCode.receiveTimeout, ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.sendTimeout:
        return Failure(ResponseCode.sendTimeout, ResponseMessage.SEND_TIMEOUT);
      case DataSource.cacheError:
        return Failure(ResponseCode.cacheError, ResponseMessage.CACHE_ERROR);
      case DataSource.noInternetConnection:
        return Failure(ResponseCode.noInternetConnection,
            ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.defaultError:
        return Failure(ResponseCode.defaultError, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 201; // success with no data (no content)
  static const int badRequest = 400; // failure, API rejected request
  static const int unauthorised = 401; // failure, user is not authorised
  static const int forbidden = 403; //  failure, API rejected request
  static const int internalServerError = 500; // failure, crash in server side
  static const int notFound = 404; // failure, not found

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int defaultError = -7;
}

class ResponseMessage {
  static const String SUCCESS = success; // success with data
  static const String NO_CONTENT = success; // success with no data (no content)
  static const String BAD_REQUEST =
      strBadRequestError; // failure, API rejected request
  static const String UNAUTHORISED =
      strUnauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      strForbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      strInternalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      strNotFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = strTimeoutError;
  static const String CANCEL = strDefaultError;
  static const String RECEIVE_TIMEOUT = strTimeoutError;
  static const String SEND_TIMEOUT = strTimeoutError;
  static const String CACHE_ERROR = strCacheError;
  static const String NO_INTERNET_CONNECTION = strNoInternetError;
  static const String DEFAULT = strDefaultError;
}
