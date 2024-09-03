import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotable/core/constant/constant.dart';

class CategoryApiServices {
  final Dio dio;
  CategoryApiServices({required this.dio});
  Future<Response<dynamic>> getCategories() async {
    try {
      const path = '$quoteBaseUrl$tagsEndpoint';
      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> getCategoryQuotes({required String tag}) async {
    try {
      final path = "$quoteBaseUrl$quotesEndpoint?tags='$tag'";
      debugPrint("path: $path");
      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }
}
