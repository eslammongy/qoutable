import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

abstract class RemoteQuoteState extends Equatable {
  final List<QuoteEntity>? quotes;
  final DioException? error;

  const RemoteQuoteState({this.quotes, this.error});

  @override
  List<Object> get props => [quotes!, error!];
}

class RemoteQuoteLoading extends RemoteQuoteState {
  const RemoteQuoteLoading();
}

class RemoteQuotesSuccess extends RemoteQuoteState {
  const RemoteQuotesSuccess({required List<QuoteEntity> quotes})
      : super(quotes: quotes);
}

class RemoteQuoteFailed extends RemoteQuoteState {
  const RemoteQuoteFailed({required DioException error}) : super(error: error);
}
