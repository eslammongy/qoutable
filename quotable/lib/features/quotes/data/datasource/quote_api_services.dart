import 'package:dio/dio.dart';
import 'package:quotable/core/constant/constant.dart';

class QuoteApiServices {
  final Dio dio;
  QuoteApiServices({required this.dio});
  Future<Response<dynamic>> getRemoteQuotes({int limit = 30}) async {
    try {
      final path = '$quoteBaseUrl$quotesEndpoint?limit=$limit';
      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }
}
