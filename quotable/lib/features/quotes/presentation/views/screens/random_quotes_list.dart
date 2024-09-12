import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/core/widgets/custom_error_widget.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_listview.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_state.dart';

class RandomQuotesList extends StatefulWidget {
  const RandomQuotesList({super.key});

  @override
  State<RandomQuotesList> createState() => _RandomQuotesListState();
}

class _RandomQuotesListState extends State<RandomQuotesList> {
  final ScrollController _scrollController = ScrollController();
  late final RemoteQuoteBloc remoteQuoteBloc;

  @override
  void initState() {
    super.initState();
    remoteQuoteBloc = RemoteQuoteBloc.get(context);
    remoteQuoteBloc.add(const FetchRemoteQuotes());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteQuoteBloc, RemoteQuoteState>(
      builder: (context, state) {
        if (state is RemoteQuotesSuccess || remoteQuoteBloc.quotes.isNotEmpty) {
          return QuoteListView(
            controller: _scrollController,
            quotes: state.quotes!,
            isLoadingMore:
                remoteQuoteBloc.isFetching && remoteQuoteBloc.currentPage > 1,
          );
        } else if (state is RemoteQuoteFailed) {
          return CustomErrorWidget(
            failure: state.error!,
            onPressed: () {
              //remoteQuoteBloc.isFetching = true;
              debugPrint("onPressed: ${remoteQuoteBloc.isFetching}");
              remoteQuoteBloc.add(const FetchRemoteQuotes());
            },
          );
        } else {
          return displayLoadingWidget(loadingMsg: loadingMsg);
        }
      },
    );
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      remoteQuoteBloc.add(const FetchRemoteQuotes());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
