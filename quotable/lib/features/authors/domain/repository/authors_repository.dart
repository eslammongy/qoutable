import 'package:quotable/config/resources/data_state.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';

abstract class AuthorsRepository {
  Future<DataState<List<AuthorEntity>>> fetchAllAuthors();
}
