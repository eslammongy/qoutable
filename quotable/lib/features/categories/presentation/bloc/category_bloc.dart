import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';
import 'package:quotable/features/categories/presentation/bloc/category_event.dart';
import 'package:quotable/features/categories/presentation/bloc/category_state.dart';
import 'package:quotable/features/categories/domain/usecaces/fetch_categories_usecase.dart';
import 'package:quotable/features/categories/domain/usecaces/fetch_category_quotes_usecase.dart';

class CategoriesBloc extends Bloc<CategoriesEvents, CategoriesStates> {
  final FetchCategoriesUseCase fetchRemoteCategories;
  final FetchCategoryQuotesUseCase fetchCategoryQuotesUseCase;
  CategoriesBloc(
    this.fetchRemoteCategories,
    this.fetchCategoryQuotesUseCase,
  ) : super(const CategoriesStateInit()) {
    on<FetchRemoteCategoriesEvent>(onFetchRemoteCategories);
    on<FetchRemoteCategoryQuotesEvent>(onFetchRemoteCategoryQuotes);
  }

  List<CategoryEntity> categories = [];
  List<QuoteEntity> quotes = [];

  onFetchRemoteCategories(
    FetchRemoteCategoriesEvent event,
    Emitter<CategoriesStates> emit,
  ) async {
    if (categories.isNotEmpty) {
      emit(CategoriesStateSuccess(categories: categories));
    }
    emit(const CategoriesStateLoading());
    final dataState = await fetchRemoteCategories();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      categories = dataState.data!;
      emit(CategoriesStateSuccess(categories: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(CategoryStateFailed(error: dataState.error!));
    }
  }

  onFetchRemoteCategoryQuotes(
    FetchRemoteCategoryQuotesEvent event,
    Emitter<CategoriesStates> emit,
  ) async {
    if (quotes.isNotEmpty) {
      emit(CategoriesStateFetchQuotesSuccess(quotes: quotes));
      return;
    }
    emit(const CategoriesStateLoading());
    final dataState = await fetchCategoryQuotesUseCase.call(params: event.tag);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      quotes = dataState.data!;
      emit(CategoriesStateFetchQuotesSuccess(quotes: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(CategoryStateFailed(error: dataState.error!));
    }
  }
}
