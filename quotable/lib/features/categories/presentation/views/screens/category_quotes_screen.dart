import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_list_item.dart';
import 'package:quotable/features/quotes/presentation/views/screens/random_quotes_list.dart';

// Sample list of items related to the category
final List<QuoteEntity> items = [
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
  fakeQuote(),
];

class CategoryQuotesScreen extends StatelessWidget {
  const CategoryQuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.appColors.background,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            backgroundColor: context.theme.appColors.surface,
            elevation: 2,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12))),
            scrolledUnderElevation: 2,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Quotes in Productivity'),
              centerTitle: true,
              background: DecoratedBox(decoration: pubBoxDecoration),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = items[index];
                  return QuoteListItem(quote: item);
                },
                childCount: items.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
