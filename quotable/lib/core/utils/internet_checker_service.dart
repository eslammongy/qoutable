import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetChecker {
  static final InternetChecker _instance = InternetChecker._internal();
  static bool _hasConnection = false;

  InternetChecker._internal() {
    // Listen to status changes and update the connection status.
    InternetConnectionChecker().onStatusChange.listen(
      (status) {
        debugPrint("Network Connection status: $status");
        _hasConnection = status == InternetConnectionStatus.connected;
      },
    );
  }

  factory InternetChecker.init() {
    return _instance;
  }

  static Future<bool> checkConnection() async {
    if (_hasConnection) return _hasConnection;
    return Future.delayed(
        const Duration(milliseconds: 10), () => _hasConnection);
  }
}
