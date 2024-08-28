import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/data/models/quote.dart';
import 'package:quotable/core/utils/internet_checker_service.dart';
import 'package:quotable/features/quotes/data/datasource/quote_api_services.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteApiServices quoteApiServices;
  QuoteRepositoryImpl({required this.quoteApiServices});
  @override
  Future<DataState<List<QuoteModel>>> fetchRemoteQuotes() async {
    if (!await InternetChecker.checkConnection()) {
      return DataFailed(noConnectionError());
    }
    try {
      final response = await quoteApiServices.getRemoteQuotes(limit: 30);

      if (response.statusCode == HttpStatus.ok) {
        final quotesJson = response.data['results'] as List;
        final quotes =
            quotesJson.map((json) => QuoteModel.fromJson(json)).toList();
        return DataSuccess(quotes);
      } else {
        return DataFailed(badResponseError(response));
      }
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  DioException noConnectionError() {
    final dioError = DioException(
      requestOptions: RequestOptions(),
      error: connectionErrMsg,
      message: connectionErrMsg,
      type: DioExceptionType.connectionError,
      response: null,
    );
    return dioError;
  }

  DioException badResponseError(Response response) {
    final dioError = DioException(
      requestOptions: response.requestOptions,
      error: response.statusMessage,
      type: DioExceptionType.badResponse,
      response: response,
    );
    return dioError;
  }
}
