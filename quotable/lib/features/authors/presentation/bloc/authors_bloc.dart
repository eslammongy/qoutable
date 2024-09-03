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

  List<AuthorEntity> authors = [];
  List<QuoteEntity> quotes = [];

  onFetchRemoteCategories(
    FetchRemoteAuthorsEvent event,
    Emitter<AuthorsStates> emit,
  ) async {
    if (authors.isNotEmpty) {
      emit(AuthorsStateSuccess(authors: authors));
    }
    emit(const AuthorsStateLoading());
    final dataState = await fetchAllAuthorsUsecase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      authors = dataState.data!;
      emit(AuthorsStateSuccess(authors: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(AuthorsStateFailed(error: dataState.error!));
    }
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
