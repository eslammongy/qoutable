import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';

class DeleteQuoteLocallyUsecase extends UseCase<void, int> {
  final QuoteRepository quoteRepository;

  DeleteQuoteLocallyUsecase({required this.quoteRepository});

  @override
  Future<void> call({int? params}) {
    return quoteRepository.deleteQuoteLocally(id: params!);
  }
}
