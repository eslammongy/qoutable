import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_state.dart';

class SingleQuoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SingleQuoteAppBar({
    super.key,
    required this.quote,
  });
  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.appColors.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            AppAssets.quotes,
            width: 32,
          ),
          const SizedBox(width: 8),
          Text(
            kAppName,
            textAlign: TextAlign.start,
            style: TextStyles.font20Bold,
          ),
        ],
      ),
      leading: SizedBox(
        height: 45,
        width: 45,
        child: InkWell(
            onTap: () => GoRouter.of(context).pop(),
            borderRadius: BorderRadius.circular(100),
            child: const Icon(Icons.arrow_back_ios_rounded)),
      ),
      actions: [
        BlocBuilder<LocalQuoteBloc, LocalQuoteStates>(
          builder: (context, state) {
            if (quote.isBookmarked) {
              return bookmarkActionBtn(
                icon: Icons.bookmark_remove_rounded,
                actionOnTap: () {
                  quote.isBookmarked = false;
                  context
                      .read<LocalQuoteBloc>()
                      .add(DeleteLocalQuotesEvent(id: quote.id));
                },
              );
            }
            return bookmarkActionBtn(
              actionOnTap: () {
                quote.isBookmarked = true;
                context
                    .read<LocalQuoteBloc>()
                    .add(SaveLocalQuotesEvent(quote: quote));
              },
            );
          },
        )
      ],
    );
  }

  SizedBox bookmarkActionBtn(
      {Function()? actionOnTap, IconData icon = Icons.bookmark_add_outlined}) {
    return SizedBox(
      height: 45,
      width: 45,
      child: InkWell(
          onTap: actionOnTap,
          borderRadius: BorderRadius.circular(100),
          child: Icon(
            icon,
            size: 30,
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
