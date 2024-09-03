import 'package:quotable/features/authors/domain/entities/author.dart';

class AuthorModel extends AuthorEntity {
  const AuthorModel({
    super.id,
    super.name,
    super.bio,
    super.description,
    super.link,
    super.quoteCount,
  });
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'bio': bio,
      'description': description,
      'link': link,
      'quoteCount': quoteCount,
    };
  }

  factory AuthorModel.fromMap(Map<String, dynamic> map) {
    return AuthorModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      bio: map['bio'] != null ? map['bio'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
      link: map['link'] != null ? map['link'] as String : null,
      quoteCount: map['quoteCount'] != null ? map['quoteCount'] as int : null,
    );
  }
}
