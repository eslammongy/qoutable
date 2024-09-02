import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/categories/presentation/bloc/category_event.dart';
import 'package:quotable/features/categories/presentation/bloc/category_state.dart';
import 'package:quotable/features/categories/domain/usecaces/fetch_categories_usecase.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates> {
  final FetchCategoriesUseCase fetchRemoteCategories;
  CategoriesBloc(this.fetchRemoteCategories)
      : super(const CategoriesStateLoading()) {
    on<FetchRemoteCategoriesEvent>(onFetchRemoteCategories);
  }

  onFetchRemoteCategories(
    FetchRemoteCategoriesEvent event,
    Emitter<CategoriesStates> emit,
  ) async {
    final dataState = await fetchRemoteCategories();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(CategoriesStateSuccess(categories: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(CategoryStateFailed(error: dataState.error!));
    }
  }
}
