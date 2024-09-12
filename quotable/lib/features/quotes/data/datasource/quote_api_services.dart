import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotable/core/constant/constant.dart';

class QuoteApiServices {
  final Dio dio;
  QuoteApiServices({required this.dio});
  Future<Response<dynamic>> getRemoteQuotes({required int page}) async {
    try {
      final path = '$quoteBaseUrl$quotesEndpoint?page=$page';

      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      debugPrint("Quote Request Error::$e");
      rethrow;
    }
  }
}
