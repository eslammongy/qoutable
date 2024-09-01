import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/widgets/single_view_appbar.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_font_toggles.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_decorated_box.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_theme_toggles.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_state.dart';

class SingleQuoteScreen extends StatelessWidget {
  const SingleQuoteScreen({super.key, required this.quote});
  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DecorateQuoteBloc>(
      create: (context) => DecorateQuoteBloc(),
      child: Scaffold(
        appBar: singleViewAppBar(context, title: ''),
        body: BlocBuilder<DecorateQuoteBloc, DecorateQuoteState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: kToolbarHeight - 20,
                  ),
                  QuoteDecoratedBox(
                    quote: quote,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const QuoteThemeToggles(),
                  const SizedBox(
                    height: 20,
                  ),
                  const QuoteFontToggles()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
