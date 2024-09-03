import 'package:equatable/equatable.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String? name;
  final int? quoteCount;
  final List<QuoteEntity>? quotes;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.quotes,
    this.quoteCount,
  });

  @override
  List<Object?> get props {
    return [id, name, quotes, quoteCount];
  }
}
