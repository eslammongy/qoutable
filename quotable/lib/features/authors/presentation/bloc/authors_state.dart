import 'package:equatable/equatable.dart';
import 'package:quotable/core/error/api_failure.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';

abstract class AuthorsStates extends Equatable {
  final List<AuthorEntity>? authors;
  final List<QuoteEntity>? quotes;
  final Failure? error;

  const AuthorsStates({this.authors, this.quotes, this.error});

  @override
  List<Object?> get props => [authors, quotes, error];
}

class AuthorsStateInit extends AuthorsStates {
  const AuthorsStateInit();
}

class AuthorsStateLoading extends AuthorsStates {
  const AuthorsStateLoading();
}

class AuthorsStateSuccess extends AuthorsStates {
  const AuthorsStateSuccess({required List<AuthorEntity> authors})
      : super(authors: authors);
}

class AuthorsStateFetchQuotesSuccess extends AuthorsStates {
  const AuthorsStateFetchQuotesSuccess({required List<QuoteEntity> quotes})
      : super(quotes: quotes);
}

class AuthorsStateFailed extends AuthorsStates {
  const AuthorsStateFailed({required Failure error}) : super(error: error);
}
