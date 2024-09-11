import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotable/core/constant/constant.dart';

class QuoteApiServices {
  final Dio dio;
  QuoteApiServices({required this.dio});
  Future<Response<dynamic>> getRemoteQuotes({required int page}) async {
    try {
      const path = '$quoteBaseUrl$quotesEndpoint';

      final dioResponse =
          await dio.get(path, queryParameters: {'page': page}).then(
        (value) {
          debugPrint("Quote Request::${value.requestOptions.uri}");
        },
      ).onError(
        (error, stackTrace) {
          debugPrint("Quote Request Error::$error");
        },
      );
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }
}
