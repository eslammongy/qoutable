import 'package:equatable/equatable.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';

abstract class CategoryStates extends Equatable {
  final List<CategoryEntity>? categories;
  final Failure? error;

  const CategoryStates({this.categories, this.error});

  @override
  List<Object> get props => [categories!, error!];
}

class CategoryStateLoading extends CategoryStates {
  const CategoryStateLoading();
}

class CategoryStateSuccess extends CategoryStates {
  const CategoryStateSuccess({required List<CategoryEntity> categories})
      : super(categories: categories);
}

class CategoryStateFailed extends CategoryStates {
  const CategoryStateFailed({required Failure error}) : super(error: error);
}
