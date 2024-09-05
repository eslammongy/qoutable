import 'package:quotable/features/quotes/domain/entities/quote.dart';

class QuoteModel extends QuoteEntity {
  QuoteModel({
    super.quoteId,
    super.author,
    super.content,
    super.tags,
  });

  // Factory constructor to create an instance from JSON
  factory QuoteModel.fromJson(Map<dynamic, dynamic> json) {
    return QuoteModel(
      quoteId: json['_id'],
      author: json['author'],
      content: json['content'],
      tags: List<String>.from(json['tags']),
    );
  }
}
