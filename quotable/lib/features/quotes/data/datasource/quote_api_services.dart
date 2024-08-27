import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:retrofit/retrofit.dart';
import 'package:quotable/core/constant/strings.dart';

class QuoteApiServices {
  final Dio dio;
  QuoteApiServices({required this.dio});
  Future<Response<dynamic>> fetchRemoteQuotes(
      {@Query("limit") int limit = 30}) async {
    try {
      final path = '$quoteBaseUrl$quotesEndpoint?limit=$limit';
      debugPrint("ErrorMsg:: $path");
      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }
}
