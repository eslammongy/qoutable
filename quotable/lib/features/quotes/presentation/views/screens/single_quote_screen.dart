import 'package:flutter/material.dart';
import 'package:quotable/core/widgets/single_view_appbar.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_decorated_box.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_theme_toggels.dart';

class SingleQuoteScreen extends StatelessWidget {
  const SingleQuoteScreen({super.key, required this.quote});
  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: singleViewAppBar(context, title: quote.author ?? ''),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            QuoteDecoratedBox(
              quote: quote,
              key: quoteDecoratedBoxKey,
            ),
            const SizedBox(
              height: 20,
            ),
            const QuoteThemeToggles()
          ],
        ),
      ),
    );
  }
}
