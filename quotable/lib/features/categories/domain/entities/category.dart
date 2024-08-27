import 'package:equatable/equatable.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

class CategoryEntity extends Equatable {
  final String? id;
  final String? name;
  final List<QuoteEntity> quotes;

  const CategoryEntity(
      {required this.id, required this.name, required this.quotes});

  @override
  List<Object?> get props {
    return [
      id,
      name,
      quotes,
    ];
  }
}
