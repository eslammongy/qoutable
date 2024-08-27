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
      final response = await quoteApiServices.fetchRemoteQuotes(limit: 30);

      if (response.statusCode == HttpStatus.ok) {
        final responseJson = response.data;
        debugPrint("Success:: $responseJson");
        return DataSuccess(response.data);
      } else {
        final dioError = DioException(
          requestOptions: response.requestOptions,
          error: response.statusMessage,
          type: DioExceptionType.badResponse,
          response: response,
        );
        return DataFailed(dioError);
      }
    } on DioException catch (error) {
      debugPrint("ErrorMsg:: ${error.message}");
      return DataFailed(error);
    }
  }
}
