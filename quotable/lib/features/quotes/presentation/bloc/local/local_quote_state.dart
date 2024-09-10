import 'package:equatable/equatable.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

abstract class LocalQuoteStates extends Equatable {
  final List<QuoteEntity>? quotes;

  const LocalQuoteStates({this.quotes});

  @override
  List<Object?> get props => [quotes];
}

class LocalQuoteInitState extends LocalQuoteStates {
  const LocalQuoteInitState();
}

class LocalQuoteLoadingState extends LocalQuoteStates {
  const LocalQuoteLoadingState();
}

class LocalQuotesLoadedState extends LocalQuoteStates {
  const LocalQuotesLoadedState({required List<QuoteEntity> quotes})
      : super(quotes: quotes);
}

class LocalQuotesSaveState extends LocalQuoteStates {
  final int quoteId;
  const LocalQuotesSaveState({required this.quoteId});
}

class LocalQuotesDeleteState extends LocalQuoteStates {
  const LocalQuotesDeleteState();
}

class LocalQuoteFailed extends LocalQuoteStates {
  final String? msg;
  const LocalQuoteFailed({this.msg});
}
