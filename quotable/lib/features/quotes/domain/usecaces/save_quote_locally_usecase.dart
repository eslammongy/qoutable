import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';

class SaveQuoteLocallyUsecase extends UseCase<void, QuoteEntity> {
  final QuoteRepository quoteRepository;

  SaveQuoteLocallyUsecase({required this.quoteRepository});

  @override
  Future<void> call({QuoteEntity? params}) {
    return quoteRepository.saveQuoteLocally(quote: params!);
  }
}
