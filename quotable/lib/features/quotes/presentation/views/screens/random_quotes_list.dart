import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_list_item.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_state.dart';

class RandomQuotesList extends StatelessWidget {
  const RandomQuotesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteQuoteBloc, RemoteQuoteState>(
      builder: (context, state) {
        if (state is RemoteQuotesSuccess) {
          return _displayQuoteListView(state.quotes!);
        } else if (state is RemoteQuoteFailed) {
          return displayErrorWidget(context, state.error!);
        } else {
          return displayLoadingWidget(loadingMsg: loadingMsg);
        }
      },
    );
  }

  ListView _displayQuoteListView(List<QuoteEntity> quotes) {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: quotes.length,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
        itemBuilder: (context, index) {
          return QuoteListItem(
            quote: quotes[index],
          );
        });
  }
}

fakeQuote() => const QuoteEntity(
    id: "9000i00jkmk",
    author: "Eslam Mongy",
    content:
        "Faith, as well intentioned as it may be, must be built on facts, not fiction--faith in fiction is a damnable false hope.");
