class AuthorEntity {
  final String? id;
  final String? name;
  final String? bio;
  final String? description;
  final String? link;
  final int? quoteCount;

  const AuthorEntity(
      {this.id,
      this.name,
      this.bio,
      this.description,
      this.link,
      this.quoteCount});
}
