import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/routes/app_routes.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_state.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/bookmark_list_item.dart';

class BookmarkList extends StatelessWidget {
  const BookmarkList({super.key});

  @override
  Widget build(BuildContext context) {
    final localQuoteBloc = BlocProvider.of<LocalQuoteBloc>(context);
    return BlocConsumer<LocalQuoteBloc, LocalQuoteStates>(
        bloc: localQuoteBloc..add(const FetchLocalQuotesEvent()),
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LocalQuotesLoadSuccess ||
              localQuoteBloc.quotes.isNotEmpty) {
            return _displayQuoteListView(state.quotes ?? localQuoteBloc.quotes);
          } else if (state is LocalQuoteFailed) {
            return Text("${state.msg}");
          } else {
            return displayLoadingWidget(loadingMsg: loadingMsg);
          }
        });
  }

  _displayQuoteListView(List<QuoteEntity> quotes) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: quotes.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.singleQuoteScreen, extra: quotes[index]);
            },
            borderRadius: BorderRadius.circular(16),
            child: BookmarkListItem(
              quote: quotes[index],
            ));
      },
    );
  }
}
