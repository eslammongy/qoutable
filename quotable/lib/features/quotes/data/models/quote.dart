import 'package:quotable/features/quotes/domain/entities/quote.dart';

class QuoteModel extends QuoteEntity {
  const QuoteModel({
    String? id,
    String? author,
    String? content,
    List<String>? tags,
    String? dateBookmarked,
  });

  // Factory constructor to create an instance from JSON
  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['_id'],
      author: json['author'],
      content: json['content'],
      tags: List<String>.from(json['tags']),
      dateBookmarked: json['dateBookmarked'],
    );
  }
}
