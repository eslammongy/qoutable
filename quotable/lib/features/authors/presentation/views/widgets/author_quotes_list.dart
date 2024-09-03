import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_bloc.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_event.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_state.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_list_item.dart';

class AuthorQuotesList extends StatelessWidget {
  const AuthorQuotesList({super.key, required this.author});
  final AuthorEntity author;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthorsBloc, AuthorsStates>(
      bloc: BlocProvider.of<AuthorsBloc>(context)
        ..add(
          FetchAuthorQuotesEvent(name: author.name ?? ''),
        ),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthorsStateFetchQuotesSuccess) {
          return _displayCategoryQuotes(state.quotes ?? []);
        } else if (state is AuthorsStateFailed) {
          return SliverFillRemaining(
            child: Align(
                alignment: Alignment.center,
                child: displayErrorWidget(context, state.error!)),
          );
        } else {
          return SliverFillRemaining(
            child: Align(
                alignment: Alignment.center,
                child: displayLoadingWidget(
                    loadingMsg: 'Loading author quotes...')),
          );
        }
      },
    );
  }

  Widget _displayCategoryQuotes(List<QuoteEntity> quotes) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final item = quotes[index];
            return QuoteListItem(quote: item);
          },
          childCount: quotes.length,
        ),
      ),
    );
  }
}
