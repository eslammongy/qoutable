import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/usecaces/fetch_remote_quote_usecase.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_state.dart';

class RemoteQuoteBloc extends Bloc<RemoteQuotesEvent, RemoteQuoteState> {
  final FetchRemoteQuotesUseCase fetchQuotesUseCase;
  RemoteQuoteBloc(this.fetchQuotesUseCase) : super(const RemoteQuoteLoading()) {
    on<FetchRemoteQuotes>(onFetchRemoteQuoteUseCase);
  }

  onFetchRemoteQuoteUseCase(
    FetchRemoteQuotes event,
    Emitter<RemoteQuoteState> emit,
  ) async {
    final dataState = await fetchQuotesUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      debugPrint("Quote: ${dataState.data![0].content}");
      emit(RemoteQuotesSuccess(quotes: dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(RemoteQuoteFailed(error: dataState.error!));
    }
  }
}
