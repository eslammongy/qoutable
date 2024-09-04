import 'package:equatable/equatable.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

abstract class LocalQuoteStates extends Equatable {
  final List<QuoteEntity>? quotes;

  const LocalQuoteStates({this.quotes});

  @override
  List<Object> get props => [quotes!];
}

class LocalQuoteInitState extends LocalQuoteStates {
  const LocalQuoteInitState();
}

class LocalQuoteLoading extends LocalQuoteStates {
  const LocalQuoteLoading();
}

class LocalQuotesLoadSuccess extends LocalQuoteStates {
  const LocalQuotesLoadSuccess({required List<QuoteEntity> quotes})
      : super(quotes: quotes);
}

class LocalQuotesSaveSuccess extends LocalQuoteStates {
  const LocalQuotesSaveSuccess();
}

class LocalQuoteFailed extends LocalQuoteStates {
  final String? msg;
  const LocalQuoteFailed({this.msg});
}
