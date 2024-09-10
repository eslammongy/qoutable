import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';

class SaveQuoteLocallyUsecase extends UseCase<int, QuoteEntity> {
  final QuoteRepository quoteRepository;

  SaveQuoteLocallyUsecase({required this.quoteRepository});

  @override
  Future<int> call({QuoteEntity? params}) {
    return quoteRepository.saveQuoteLocally(quote: params!);
  }
}
