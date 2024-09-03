import 'package:quotable/core/usecaces/usecase.dart';
import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/authors/domain/repository/authors_repository.dart';

class FetchAllAuthorsUsecase
    extends UseCase<DataState<List<AuthorEntity>>, void> {
  final AuthorsRepository authorsRepository;
  FetchAllAuthorsUsecase({required this.authorsRepository});
  @override
  Future<DataState<List<AuthorEntity>>> call({void params}) async {
    return await authorsRepository.fetchAllAuthors();
  }
}
