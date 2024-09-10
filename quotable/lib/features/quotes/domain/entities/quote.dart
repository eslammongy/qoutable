import 'package:objectbox/objectbox.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

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

  QuoteEntity copyWith({
    int? id,
    String? quoteId,
    String? author,
    String? content,
    List<String>? tags,
    bool? isBookmarked,
  }) {
    return QuoteEntity(
      quoteId: quoteId ?? this.quoteId,
      author: author ?? this.author,
      content: content ?? this.content,
      tags: tags ?? this.tags,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}
