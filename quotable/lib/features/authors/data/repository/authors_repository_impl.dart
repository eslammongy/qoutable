import 'dart:io';
import 'package:dio/dio.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/core/utils/internet_checker_service.dart';
import 'package:quotable/features/authors/data/models/author.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/authors/data/datasource/authors_api_service.dart';
import 'package:quotable/features/authors/domain/repository/authors_repository.dart';

class AuthorsRepositoryImpl implements AuthorsRepository {
  final AuthorsApiService apiService;

  AuthorsRepositoryImpl({required this.apiService});
  @override
  Future<DataState<List<AuthorEntity>>> fetchAllAuthors() async {
    if (!await InternetChecker.checkConnection()) {
      return DataFailed(ServerFailure.handleError(noConnection()));
    }
    try {
      final response = await apiService.getAllAuthors();
      if (response.statusCode == HttpStatus.ok) {
        final authorsJson = response.data as List;
        final authors =
            authorsJson.map((json) => AuthorModel.fromMap(json)).toList();
        return DataSuccess(authors);
      } else {
        return DataFailed(ServerFailure.handleError(badResponse(response)));
      }
    } on DioException catch (error) {
      return DataFailed(ServerFailure.handleError(error));
    }
  }
}
