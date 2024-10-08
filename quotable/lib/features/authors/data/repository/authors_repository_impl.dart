import 'dart:io';
import 'package:dio/dio.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/data/models/quote.dart';
import 'package:quotable/core/utils/internet_checker_service.dart';
import 'package:quotable/features/authors/data/models/author.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/authors/data/datasource/authors_api_service.dart';
import 'package:quotable/features/authors/domain/repository/authors_repository.dart';

class AuthorsRepositoryImpl implements AuthorsRepository {
  final AuthorsApiService apiService;

  AuthorsRepositoryImpl({required this.apiService});
  @override
  Future<DataState<List<AuthorEntity>>> fetchAllAuthors(
      {required int page}) async {
    if (!await InternetChecker.checkConnection()) {
      return DataFailed(ServerFailure.handleError(noConnection()));
    }
    try {
      final response = await apiService.getAllAuthors(page: page);
      if (response.statusCode == HttpStatus.ok) {
        final List<AuthorEntity> authors = [];
        final authorsJson = response.data['results'] as List;
        for (var json in authorsJson) {
          final author = AuthorModel.fromMap(json);
          if (author.quoteCount != null && author.quoteCount! > 0) {
            authors.add(author);
          }
        }

        return DataSuccess(authors);
      } else {
        return DataFailed(ServerFailure.handleError(badResponse(response)));
      }
    } on DioException catch (error) {
      return DataFailed(ServerFailure.handleError(error));
    }
  }

  @override
  Future<DataState<List<QuoteEntity>>> fetchAuthorQuotes(
      {required String author}) async {
    if (!await InternetChecker.checkConnection()) {
      return DataFailed(ServerFailure.handleError(noConnection()));
    }
    try {
      final response = await apiService.getAllAuthorQuotes(author);
      if (response.statusCode == HttpStatus.ok) {
        final quotesJson = response.data['results'] as List;

        final quotes = quotesJson.map((json) {
          return QuoteModel.fromJson(json);
        }).toList();
        return DataSuccess(quotes);
      } else {
        return DataFailed(ServerFailure.handleError(badResponse(response)));
      }
    } on DioException catch (error) {
      return DataFailed(ServerFailure.handleError(error));
    }
  }
}
