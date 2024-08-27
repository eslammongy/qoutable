import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';

class FetchRemoteQuotesUseCase
    implements UseCase<DataState<List<QuoteEntity>>, void> {
  final QuoteRepository quoteRepository;

  FetchRemoteQuotesUseCase({required this.quoteRepository});

  @override
  Future<DataState<List<QuoteEntity>>> call({void params}) async{
    return await quoteRepository.fetchRemoteQuotes();
  }
}
