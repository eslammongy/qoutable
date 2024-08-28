import 'package:dio/dio.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetChecker {
  static bool _hasConnection = false;

  static init() {
    InternetConnectionChecker instance = InternetConnectionChecker();
    // initial status
    instance.connectionStatus.then(
      (value) => _hasConnection = value == InternetConnectionStatus.connected,
    );

    // listen to status change
    instance.onStatusChange.listen(
      (status) {
        _hasConnection = status == InternetConnectionStatus.connected;
      },
    );
  }

  /// this dio exception "connectionError" related to NoInternetConnection exp.
  /// throwing NoInternetConnection exp
  static checkConnection() {
    if (!_hasConnection) {
      final dioError = DioException(
        requestOptions: RequestOptions(),
        error: connectionErrMsg,
        message:connectionErrMsg,
        type: DioExceptionType.connectionError,
        response: null,
      );

      throw dioError;
    }
  }
}
