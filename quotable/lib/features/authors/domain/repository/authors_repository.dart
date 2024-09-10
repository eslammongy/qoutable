import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';

abstract class AuthorsRepository {
  Future<DataState<List<AuthorEntity>>> fetchAllAuthors({required int page});
  Future<DataState<List<QuoteEntity>>> fetchAuthorQuotes(
      {required String author});
}
