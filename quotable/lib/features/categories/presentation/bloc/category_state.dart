import 'package:equatable/equatable.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';

abstract class CategoriesStates extends Equatable {
  final List<CategoryEntity>? categories;
  final Failure? error;

  const CategoriesStates({this.categories, this.error});

  @override
  List<Object> get props => [categories!, error!];
}

class CategoriesStateLoading extends CategoriesStates {
  const CategoriesStateLoading();
}

class CategoriesStateSuccess extends CategoriesStates {
  const CategoriesStateSuccess({required List<CategoryEntity> categories})
      : super(categories: categories);
}

class CategoryStateFailed extends CategoriesStates {
  const CategoryStateFailed({required Failure error}) : super(error: error);
}
