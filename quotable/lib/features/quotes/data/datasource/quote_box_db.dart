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

  void saveQuoteLocally({required QuoteEntity quote}) {
    try {
      quoteBox.put(quote);
      debugPrint("save quote locally");
    } catch (e) {
      rethrow;
    }
  }

  Future<List<QuoteEntity>> getSavedQuotes() async {
    try {
      final listOfSessions = await quoteBox.getAllAsync();
      return listOfSessions;
    } catch (e) {
      rethrow;
    }
  }

  void deleteSelectedQuote(int quoteId) {
    try {
      quoteBox.remove(quoteId);
    } catch (e) {
      rethrow;
    }
  }
}
