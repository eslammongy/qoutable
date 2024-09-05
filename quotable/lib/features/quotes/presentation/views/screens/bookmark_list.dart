import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/config/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_state.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/bookmark_list_item.dart';

class BookmarkList extends StatelessWidget {
  const BookmarkList({super.key});

  @override
  Widget build(BuildContext context) {
    final localQuoteBloc = LocalQuoteBloc.get(context);
    return BlocConsumer<LocalQuoteBloc, LocalQuoteStates>(
        bloc: localQuoteBloc..add(const FetchLocalQuotesEvent()),
        listener: (context, state) {},
        builder: (context, state) {
          if (state is LocalQuoteLoadingState) {
            return displayLoadingWidget(loadingMsg: loadingMsg);
          } else if (state is LocalQuoteFailed) {
            return _displayErrorWidget(state);
          } else {
            return _displayQuoteListView(state.quotes ?? localQuoteBloc.quotes);
          }
        });
  }

  Widget _displayErrorWidget(LocalQuoteFailed state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.emptyDateImg,
            width: 260.w,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${state.msg}",
            style: TextStyles.font16Medium,
          ),
        ],
      ),
    );
  }

  _displayQuoteListView(List<QuoteEntity> quotes) {
    if (quotes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.emptyDateImg,
              width: 260.w,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "There is no quotes bookmarked or saved locally yet...",
              style: TextStyles.font16Medium,
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: quotes.length,
      padding: const EdgeInsets.only(bottom: 30),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              final details = {"from": "bookmark", "quote": quotes[index]};
              GoRouter.of(context).push(
                AppRouter.singleQuoteScreen,
                extra: details,
              );
            },
            borderRadius: BorderRadius.circular(16),
            child: BookmarkListItem(
              quote: quotes[index],
            ));
      },
    );
  }
}
