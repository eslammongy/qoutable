import 'package:quotable/features/quotes/data/models/quote.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.quotes,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      quotes: List<QuoteEntity>.from(
        (map['quotes'] as List<int>).map<QuoteEntity>(
          (x) => QuoteModel.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
