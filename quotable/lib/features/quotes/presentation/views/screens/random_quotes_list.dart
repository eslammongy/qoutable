import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
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
          return Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.responseErrorImg,
                  width: 200,
                ),
                Text(
                  "${state.error?.message}",
                  textAlign: TextAlign.center,
                  style: TextStyles.font16SemiBold,
                ),
              ],
            ),
          ));
        } else {
          return Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              Text(
                "please waiting, data is loaded...",
                textAlign: TextAlign.center,
                style: TextStyles.font16SemiBold,
              ),
            ],
          ));
        }
      },
    );
  }

  ListView _displayQuoteListView(List<QuoteEntity> quotes) {
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
