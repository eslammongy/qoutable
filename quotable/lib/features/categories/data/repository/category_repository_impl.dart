import 'dart:io';
import 'package:dio/dio.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/core/utils/internet_checker_service.dart';
import 'package:quotable/features/categories/data/models/category.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';
import 'package:quotable/features/categories/data/datasource/category_api_services.dart';
import 'package:quotable/features/categories/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryApiServices apiService;

  CategoryRepositoryImpl({required this.apiService});
  @override
  Future<DataState<List<CategoryEntity>>> fetchCategories() async {
    if (!await InternetChecker.checkConnection()) {
      return DataFailed(ServerFailure.handleError(noConnection()));
    }
    try {
      final response = await apiService.getCategories();
      if (response.statusCode == HttpStatus.ok) {
        final categoryJson = response.data as List;
        final categories =
            categoryJson.map((json) => CategoryModel.fromMap(json)).toList();
        return DataSuccess(categories);
      } else {
        return DataFailed(ServerFailure.handleError(badResponse(response)));
      }
    } on DioException catch (error) {
      return DataFailed(ServerFailure.handleError(error));
    }
  }
}
