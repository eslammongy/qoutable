import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/categories/domain/repository/category_repository.dart';

class FetchCategoryQuotesUseCase
    implements UseCase<DataState<List<QuoteEntity>>, String> {
  final CategoryRepository categoryRepository;

  FetchCategoryQuotesUseCase({required this.categoryRepository});

  @override
  Future<DataState<List<QuoteEntity>>> call({String? params}) async {
    return await categoryRepository.fetchCategoryQuotes(tag: params);
  }
}
