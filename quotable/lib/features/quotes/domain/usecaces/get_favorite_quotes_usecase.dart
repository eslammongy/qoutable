import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';

class GetFavoriteQuotesUsecase extends UseCase<List<QuoteEntity>, void> {
  final QuoteRepository quoteRepository;
  GetFavoriteQuotesUsecase({required this.quoteRepository});
  @override
  Future<List<QuoteEntity>> call({void params}) async {
    return await quoteRepository.getFavoriteQuotes();
  }
}
