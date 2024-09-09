import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/domain/usecaces/fetch_remote_quote_usecase.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_state.dart';

class RemoteQuoteBloc extends Bloc<RemoteQuotesEvent, RemoteQuoteState> {
  final FetchRemoteQuotesUseCase fetchQuotesUseCase;
  RemoteQuoteBloc(this.fetchQuotesUseCase)
      : super(const RemoteQuoteInitState()) {
    on<FetchRemoteQuotes>(onFetchRemoteQuoteUseCase);
  }

  static RemoteQuoteBloc get(BuildContext context) => BlocProvider.of(context);

  List<QuoteEntity> quotes = [];
  int currentPage = 1;
  bool isFetching = false;
  bool hasMoreAuthors = true;

  onFetchRemoteQuoteUseCase(
    FetchRemoteQuotes event,
    Emitter<RemoteQuoteState> emit,
  ) async {
    // Prevent multiple requests or if no more authors
    if (isFetching || !hasMoreAuthors) return;
    if (currentPage == 1) {
      emit(const RemoteQuoteLoading());
    }
    final result = await fetchQuotesUseCase.call(params: currentPage);

    if (result is DataSuccess && result.data!.isNotEmpty) {
      currentPage++;
      //debugPrint("Result Data:${result.data}..Current Page:$currentPage");
      quotes.addAll([...result.data!]);
      emit(RemoteQuotesSuccess(quotes: quotes));
    } else if (result is DataSuccess && result.data!.isEmpty) {
      hasMoreAuthors = false; // No more authors to load
    } else {
      emit(RemoteQuoteFailed(error: result.error!));
    }

    isFetching = false;
  }
}
