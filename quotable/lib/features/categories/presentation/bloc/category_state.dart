import 'package:equatable/equatable.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';

abstract class CategoriesStates extends Equatable {
  final List<CategoryEntity>? categories;
  final List<QuoteEntity>? quotes;
  final Failure? error;

  const CategoriesStates({this.categories, this.quotes, this.error});

  @override
  List<Object?> get props => [categories, quotes, error];
}

class CategoriesStateLoading extends CategoriesStates {
  const CategoriesStateLoading();
}

class CategoriesStateSuccess extends CategoriesStates {
  const CategoriesStateSuccess({required List<CategoryEntity> categories})
      : super(categories: categories);
}

class CategoriesStateFetchQuotesSuccess extends CategoriesStates {
  const CategoriesStateFetchQuotesSuccess({required List<QuoteEntity> quotes})
      : super(quotes: quotes);
}

class CategoryStateFailed extends CategoriesStates {
  const CategoryStateFailed({required Failure error}) : super(error: error);
}
