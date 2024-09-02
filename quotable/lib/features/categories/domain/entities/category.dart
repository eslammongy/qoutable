import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:quotable/features/quotes/data/models/quote.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

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
