import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_state.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_event.dart';
import 'package:quotable/features/authors/domain/usecaces/fetch_all_authors_usecase.dart';
import 'package:quotable/features/authors/domain/usecaces/fetch_author_quotes_usecase.dart';

class AuthorsBloc extends Bloc<AuthorsEvents, AuthorsStates> {
  final FetchAllAuthorsUsecase fetchAllAuthorsUsecase;
  final FetchAuthorQuotesUsecase fetchAuthorQuotesUsecase;
  AuthorsBloc(
    this.fetchAllAuthorsUsecase,
    this.fetchAuthorQuotesUsecase,
  ) : super(const AuthorsStateInit()) {
    on<FetchRemoteAuthorsEvent>(onFetchRemoteCategories);
    on<FetchAuthorQuotesEvent>(onFetchAuthorsQuotes);
  }

  static AuthorsBloc get(BuildContext context) =>
      BlocProvider.of<AuthorsBloc>(context);

  List<AuthorEntity> authors = [];
  List<QuoteEntity> quotes = [];
  int currentPage = 1;
  bool isFetching = false;
  bool hasMoreAuthors = true;

  onFetchRemoteCategories(
    FetchRemoteAuthorsEvent event,
    Emitter<AuthorsStates> emit,
  ) async {
    // Prevent multiple requests or if no more authors
    if (isFetching || !hasMoreAuthors) return;

    isFetching = true;
    if (currentPage == 1) {
      emit(const AuthorsStateLoading());
    }
    emit(const AuthorsStateLoading());
    final result = await fetchAllAuthorsUsecase.call(params: currentPage);

    if (result is DataSuccess && result.data!.isNotEmpty) {
      currentPage++;
      emit(AuthorsStateSuccess(authors: authors = result.data!));
    } else if (result is DataSuccess && result.data!.isEmpty) {
      hasMoreAuthors = false; // No more authors to load
    } else {
      hasMoreAuthors = false; // No more authors to load
      emit(AuthorsStateFailed(error: result.error!));
    }

    isFetching = false;
  }

  onFetchAuthorsQuotes(
    FetchAuthorQuotesEvent event,
    Emitter<AuthorsStates> emit,
  ) async {
    if (quotes.isNotEmpty) {
      emit(AuthorsStateFetchQuotesSuccess(quotes: quotes));
      return;
    }
    emit(const AuthorsStateLoading());
    final dataState = await fetchAuthorQuotesUsecase.call(params: event.name);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      quotes = dataState.data!;
      emit(AuthorsStateFetchQuotesSuccess(quotes: quotes));
    }
    if (dataState is DataFailed) {
      emit(AuthorsStateFailed(error: dataState.error!));
    }
  }
}
