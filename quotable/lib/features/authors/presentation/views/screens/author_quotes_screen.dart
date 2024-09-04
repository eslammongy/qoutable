import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_bloc.dart';
import 'package:quotable/features/authors/presentation/views/widgets/author_quotes_list.dart';

class AuthorQuotesScreen extends StatelessWidget {
  const AuthorQuotesScreen({super.key, required this.author});
  final AuthorEntity author;

  @override
  Widget build(BuildContext context) {
    final authorsBloc = BlocProvider.of<AuthorsBloc>(context);
    return PopScope(
      onPopInvokedWithResult: (_, __) {
        authorsBloc.quotes.clear();
      },
      child: Scaffold(
        backgroundColor: context.theme.appColors.background,
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              backgroundColor: context.theme.appColors.surface,
              elevation: 4,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12))),
              scrolledUnderElevation: 2,
              flexibleSpace: FlexibleSpaceBar(
                title: appBarTitleWidget(),
                centerTitle: true,
                background: const DecoratedBox(decoration: pubBoxDecoration),
              ),
              leading: appBarActionBtn(
                icon: Icons.arrow_back_ios_new_rounded,
                onTap: () {
                  authorsBloc.quotes.clear();
                  GoRouter.of(context).pop();
                },
              ),
              actions: [
                appBarActionBtn(onTap: () async {
                  await displayInfoSheet(context, author);
                })
              ],
            ),
            AuthorQuotesList(author: author)
          ],
        ),
      ),
    );
  }

  Text appBarTitleWidget() {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'Quotes in ${author.name}\n',
            style: TextStyles.font14SemiBold.copyWith(color: Colors.white),
          ),
          TextSpan(
            text: '(${author.quoteCount} Quotes)',
            style: TextStyles.font13Regular
                .copyWith(color: const Color(0xFFFFFFFF)),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }

  SizedBox appBarActionBtn(
      {Function()? onTap, IconData icon = Icons.info_rounded}) {
    return SizedBox(
      height: 45,
      width: 45,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
