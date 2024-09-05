import 'package:flutter/material.dart';
import 'package:quotable/objectbox.g.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

class ObjectBoxDB {
  late final Store store;
  late final Box<QuoteEntity> quoteBox;

  ObjectBoxDB._create(this.store) {
    quoteBox = Box<QuoteEntity>(store);
  }

  static Future<ObjectBoxDB> create() async {
    final store = await openStore();
    return ObjectBoxDB._create(store);
  }

  int saveQuoteLocally({required QuoteEntity quote}) {
    try {
      final isQuoteExist = quoteBox
          .query(QuoteEntity_.quoteId.equals('${quote.quoteId}'))
          .build()
          .findFirst();
      if (isQuoteExist != null) {
        throw Exception(
            'Can not save quote: ${quote.quoteId}, this quote already exist');
      } else {
        return quoteBox.put(quote, mode: PutMode.put);
      }
    } catch (e) {
      throw Exception(
          'Can not save quote: there was an error while saving this quote');
    }
  }

  Future<List<QuoteEntity>> getSavedQuotes() async {
    try {
      final quotes = await quoteBox.getAllAsync();
      debugPrint("Quotes Count:$quotes");
      return quotes;
    } catch (e) {
      throw Exception(
          'Can not get saved quotes: there was an error while getting saved quotes');
    }
  }

  void deleteSelectedQuote(int quoteId) {
    try {
      quoteBox.remove(quoteId);
    } catch (e) {
      throw Exception(
          'Can not delete quote: there was an error while deleting this quote');
    }
  }
}
