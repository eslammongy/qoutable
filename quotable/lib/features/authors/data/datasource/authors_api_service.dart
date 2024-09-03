import 'package:dio/dio.dart';
import 'package:quotable/core/constant/constant.dart';

class AuthorsApiService {
  final Dio dio;
  AuthorsApiService({required this.dio});

  Future<Response<dynamic>> getAllAuthors() async {
    try {
      const path = '$quoteBaseUrl$authorsEndpoint';
      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }
}
