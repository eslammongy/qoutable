import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';
import 'package:quotable/features/quotes/presentation/views/screens/random_quotes_list.dart';
import 'package:quotable/features/categories/presentation/views/widgets/category_quotes_list.dart';

// Sample list of items related to the category
final List<QuoteEntity> quotes = [
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
  const CategoryQuotesScreen({super.key, required this.category});
  final CategoryEntity category;

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
            flexibleSpace: FlexibleSpaceBar(
              title: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Quotes in ${category.name}\n',
                        style: TextStyles.font13Regular),
                    TextSpan(
                      text: '(${category.quoteCount} Quotes)',
                      style: TextStyles.font13Regular,
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              centerTitle: true,
              background: const DecoratedBox(decoration: pubBoxDecoration),
            ),
          ),
          CategoryQuotesList(category: category)
        ],
      ),
    );
  }
}
