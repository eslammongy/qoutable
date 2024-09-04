import 'package:objectbox/objectbox.dart';

@Entity()
class QuoteEntity {
  @Id()
  int id = 0;
  final String? author;
  final String? content;
  final List<String>? tags;
  final String? dateBookmarked;

  QuoteEntity({
    this.author,
    this.content,
    this.tags,
    this.dateBookmarked,
  });
}
