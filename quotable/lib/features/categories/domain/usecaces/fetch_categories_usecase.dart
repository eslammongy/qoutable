import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';
import 'package:quotable/features/categories/domain/repository/category_repository.dart';

class FetchCategoriesUseCase
    implements UseCase<DataState<List<CategoryEntity>>, void> {
  final CategoryRepository categoryRepository;

  FetchCategoriesUseCase({required this.categoryRepository});

  @override
  Future<DataState<List<CategoryEntity>>> call({void params}) async {
    return await categoryRepository.fetchCategories();
  }
}
