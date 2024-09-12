import 'package:flutter/material.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_list_item.dart';

class QuoteListView extends StatelessWidget {
  const QuoteListView(
      {super.key,
      required this.quotes,
      required this.isLoadingMore,
      this.controller});
  final List<QuoteEntity> quotes;
  final bool isLoadingMore;
  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller,
        physics: const BouncingScrollPhysics(),
        itemCount: quotes.length + (isLoadingMore ? 1 : 0), // Add
        padding: const EdgeInsets.only(bottom: 30),
        itemBuilder: (context, index) {
          if (index == quotes.length) {
            // Show loading indicator at the end
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          return QuoteListItem(
            quote: quotes[index],
          );
        });
  }
}
