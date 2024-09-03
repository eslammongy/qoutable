import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/authors/domain/repository/authors_repository.dart';

class FetchAuthorQuotesUsecase
    extends UseCase<DataState<List<QuoteEntity>>, String> {
  final AuthorsRepository authorsRepository;
  FetchAuthorQuotesUsecase({required this.authorsRepository});
  @override
  Future<DataState<List<QuoteEntity>>> call({String? params}) async {
    return await authorsRepository.fetchAuthorQuotes(author: params!);
  }
}
