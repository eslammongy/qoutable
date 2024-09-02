import 'package:dio/dio.dart';
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
}
