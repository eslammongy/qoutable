import 'package:dio/dio.dart';
import 'package:quotable/core/constant/constant.dart';

class AuthorsApiService {
  final Dio dio;
  AuthorsApiService({required this.dio});

  Future<Response<dynamic>> getAllAuthors({required int page}) async {
    try {
      final path = '$quoteBaseUrl$authorsEndpoint?page=$page';
      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response<dynamic>> getAllAuthorQuotes(String author) async {
    try {
      final path = "$quoteBaseUrl$quotesEndpoint?author='$author'";
      final dioResponse = await dio.get(path);
      return dioResponse;
    } catch (e) {
      rethrow;
    }
  }
}
