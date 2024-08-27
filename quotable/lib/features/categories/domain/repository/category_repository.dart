import 'package:quotable/features/categories/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<CategoryEntity> fetchCategoryQuotes({required String name});
}
