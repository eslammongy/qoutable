import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_state.dart';
import 'package:quotable/features/quotes/domain/usecaces/save_quote_locally_usecase.dart';
import 'package:quotable/features/quotes/domain/usecaces/get_favorite_quotes_usecase.dart';
import 'package:quotable/features/quotes/domain/usecaces/delete_quote_locally_usecase.dart';

class LocalQuoteBloc extends Bloc<LocalQuotesEvents, LocalQuoteStates> {
  final GetFavoriteQuotesUsecase getFavoriteQuotesUsecase;
  final SaveQuoteLocallyUsecase saveQuoteLocallyUsecase;
  final DeleteQuoteLocallyUsecase deleteQuoteLocallyUsecase;

  LocalQuoteBloc(
    this.getFavoriteQuotesUsecase,
    this.saveQuoteLocallyUsecase,
    this.deleteQuoteLocallyUsecase,
  ) : super(const LocalQuoteInitState()) {
    on<FetchLocalQuotesEvent>(onFetchLocalQuotesUseCase);
    on<SaveLocalQuotesEvent>(onSaveQuoteLocallyUseCase);
    on<DeleteLocalQuotesEvent>(onDeleteQuoteLocallyUseCase);
  }

  List<QuoteEntity> quotes = [];
  onFetchLocalQuotesUseCase(
    FetchLocalQuotesEvent event,
    Emitter<LocalQuoteStates> emit,
  ) async {
    if (quotes.isNotEmpty) {
      emit(LocalQuotesLoadSuccess(quotes: quotes));
    }
    emit(const LocalQuoteLoading());
    try {
      quotes = await getFavoriteQuotesUsecase();
      if (quotes.isNotEmpty) {
        emit(LocalQuotesLoadSuccess(quotes: quotes));
      } else {
        emit(const LocalQuoteFailed(msg: "There is no quotes saved yet"));
      }
    } on Exception catch (e) {
      emit(LocalQuoteFailed(msg: "$e"));
    }
  }

  onSaveQuoteLocallyUseCase(
    SaveLocalQuotesEvent event,
    Emitter<LocalQuoteStates> emit,
  ) async {
    try {
      await saveQuoteLocallyUsecase.call(params: event.quote);
      emit(const LocalQuotesSaveSuccess());
      debugPrint("Saving new quote...");
    } on Exception catch (e) {
      emit(LocalQuoteFailed(msg: "$e"));
    }
  }

  onDeleteQuoteLocallyUseCase(
    DeleteLocalQuotesEvent event,
    Emitter<LocalQuoteStates> emit,
  ) async {
    try {
      await deleteQuoteLocallyUsecase.call(params: event.id);
      emit(const LocalQuoteInitState());
    } on Exception catch (e) {
      emit(LocalQuoteFailed(msg: "$e"));
    }
  }
}
