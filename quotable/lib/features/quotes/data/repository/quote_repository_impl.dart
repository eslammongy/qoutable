import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/data/models/quote.dart';
import 'package:quotable/core/utils/internet_checker_service.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/data/datasource/quote_box_db.dart';
import 'package:quotable/features/quotes/data/datasource/quote_api_services.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';

class QuoteRepositoryImpl implements QuoteRepository {
  final QuoteApiServices quoteApiServices;
  final ObjectBoxDB objectBoxDB;
  QuoteRepositoryImpl({
    required this.quoteApiServices,
    required this.objectBoxDB,
  });
  @override
  Future<DataState<List<QuoteModel>>> fetchRemoteQuotes(
      {required int page}) async {
  /*   if (!await InternetChecker.checkConnection()) {
      return DataFailed(ServerFailure.handleError(noConnection()));
    } */
    try {
      final response = await quoteApiServices.getRemoteQuotes(page: page);

      debugPrint("Response Repo::$response");
      if (response.statusCode == HttpStatus.ok) {
        final quotesJson = response.data['results'] as List;
        final quotes =
            quotesJson.map((json) => QuoteModel.fromJson(json)).toList();
        return DataSuccess(quotes);
      } else {
        return DataFailed(ServerFailure.handleError(badResponse(response)));
      }
    } on DioException catch (error) {
      return DataFailed(ServerFailure.handleError(error));
    }
  }

  @override
  Future<List<QuoteEntity>> getFavoriteQuotes() async {
    try {
      return await objectBoxDB.getSavedQuotes();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> saveQuoteLocally({required QuoteEntity quote}) async {
    try {
      return objectBoxDB.saveQuoteLocally(quote: quote);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteQuoteLocally({required int id}) async {
    try {
      objectBoxDB.deleteSelectedQuote(id);
    } catch (e) {
      rethrow;
    }
  }
}
