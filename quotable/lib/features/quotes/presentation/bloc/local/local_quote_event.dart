import 'package:quotable/features/quotes/domain/entities/quote.dart';

abstract class LocalQuotesEvents {
  const LocalQuotesEvents();
}

class FetchLocalQuotesEvent extends LocalQuotesEvents {
  const FetchLocalQuotesEvent();
}

class SaveLocalQuotesEvent extends LocalQuotesEvents {
  final QuoteEntity quote;
  const SaveLocalQuotesEvent({
    required this.quote,
  });
}

class DeleteLocalQuotesEvent extends LocalQuotesEvents {
  final int id;
  const DeleteLocalQuotesEvent({required this.id});
}
