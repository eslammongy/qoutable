import 'package:objectbox/objectbox.dart';

@Entity()
class QuoteEntity {
  @Id()
  int id = 0;
  @Unique()
  final String? quoteId;
  final String? author;
  final String? content;
  final List<String>? tags;
  bool isBookmarked;

  QuoteEntity({
    this.quoteId,
    this.author,
    this.content,
    this.tags,
    this.isBookmarked = false,
  });
}
