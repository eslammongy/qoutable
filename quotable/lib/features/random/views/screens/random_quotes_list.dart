import 'package:flutter/material.dart';
import 'package:quotable/features/random/views/widgets/quote_list_item.dart';

class RandomQuotesList extends StatelessWidget {
  const RandomQuotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: const QuoteListItem(),
          );
        });
  }
}
