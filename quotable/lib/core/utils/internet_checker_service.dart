import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetChecker {
  InternetConnectionChecker instance = InternetConnectionChecker();
  bool hasConnection = false;

  InternetChecker([String? serverURL]) {
    // initial status
    instance.connectionStatus.then(
      (value) => hasConnection = value == InternetConnectionStatus.connected,
    );

    // listen to status change
    instance.onStatusChange.listen(
      (status) {
        hasConnection = status == InternetConnectionStatus.connected;
      },
    );
  }

  /// this dio exception "connectionError" related to NoInternetConnection exp.
  /// throwing NoInternetConnection exp
  void checkConnection() async {
    if (!hasConnection) {
      final dioException = DioException.connectionError(
          requestOptions: RequestOptions(),
          reason: "Connection Error: No Internet Connection");
      throw dioException;
    }
  }
}
