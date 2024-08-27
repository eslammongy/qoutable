import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

abstract class QuoteRepository {
  Future<DataState<List<QuoteEntity>>> fetchRemoteQuotes();
}
