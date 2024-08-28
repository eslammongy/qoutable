import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:quotable/core/constant/constant.dart';

class QuoteApiServices {
  final Dio dio;
  QuoteApiServices({required this.dio});
  Future<Response<dynamic>> getRemoteQuotes(
      {@Query("limit") int limit = 30}) async {
    try {
      final path = '$quoteBaseUrl$quotesEndpoint?limit=$limit';
      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }
}
