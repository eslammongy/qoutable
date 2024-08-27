import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/data/models/quote.dart';
import 'package:quotable/features/quotes/data/datasource/quote_api_services.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteApiServices quoteApiServices;

  QuoteRepositoryImpl({required this.quoteApiServices});
  @override
  Future<DataState<List<QuoteModel>>> fetchRemoteQuotes() async {
    try {
     // final apiResponse = await Dio().get('https://api.quotable.io/random');
      // final apiResponse = await quoteApiServices.fetchRemoteQuotes();
      debugPrint(
          "BaseUrlSuccess:: ${apiResponse.requestOptions.baseUrl}");
      if (apiResponse.statusCode == HttpStatus.ok) {
        return DataSuccess(apiResponse.data);
      } else {
        final dioError = DioException(
          requestOptions: apiResponse.requestOptions,
          error: apiResponse.statusMessage,
          type: DioExceptionType.badResponse,
          response: apiResponse,
        );
        return DataFailed(dioError);
      }
    } on DioException catch (error) {
      debugPrint("BaseUrl:: ${error.message}");
      return DataFailed(error);
    }
  }
}
