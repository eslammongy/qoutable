import 'package:quotable/features/quotes/data/models/quote.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    super.id,
    super.name,
    super.quotes,
    super.quoteCount,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      quotes: map['quotes'] != null
          ? List<QuoteEntity>.from(
              (map['quotes'] as List<QuoteEntity>).map<QuoteEntity>(
                (x) => QuoteModel.fromJson(x as Map<String, dynamic>),
              ),
            )
          : null,
      quoteCount: map['quoteCount'] != null ? map['quoteCount'] as int : null,
    );
  }
}
