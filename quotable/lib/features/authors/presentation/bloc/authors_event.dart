abstract class AuthorsEvents {
  const AuthorsEvents();
}

class FetchRemoteAuthorsEvent extends AuthorsEvents {
  const FetchRemoteAuthorsEvent();
}

class FetchAuthorQuotesEvent extends AuthorsEvents {
  final String name;
  const FetchAuthorQuotesEvent({required this.name});
}
