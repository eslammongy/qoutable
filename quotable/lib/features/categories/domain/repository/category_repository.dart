import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<DataState<List<CategoryEntity>>> fetchCategories();
}
