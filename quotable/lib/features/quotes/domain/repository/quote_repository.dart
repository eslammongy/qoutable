import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<DataState<List<QuoteEntity>>> fetchRemoteQuotes({required int page});
  Future<int> saveQuoteLocally({required QuoteEntity quote});
  Future<void> deleteQuoteLocally({required int id});
  Future<List<QuoteEntity>> getFavoriteQuotes();
}
