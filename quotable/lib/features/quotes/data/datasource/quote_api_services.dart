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
          await dio.get(path, queryParameters: {'page': page});
      return dioResponse;
    } catch (e) {
      debugPrint("Quote Request Error::$e");
      rethrow;
    }
  }
}
