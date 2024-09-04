import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';
import 'package:quotable/features/categories/presentation/bloc/category_bloc.dart';
import 'package:quotable/features/categories/presentation/views/widgets/category_quotes_list.dart';

class CategoryQuotesScreen extends StatelessWidget {
  const CategoryQuotesScreen({super.key, required this.category});
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoriesBloc>(context);
    return PopScope(
      onPopInvokedWithResult: (_, __) {
        categoryBloc.quotes.clear();
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
                title: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Quotes in ${category.name}\n',
                        style: TextStyles.font14SemiBold
                            .copyWith(color: Colors.white),
                      ),
                      TextSpan(
                        text: '(${category.quoteCount} Quotes)',
                        style: TextStyles.font13Regular
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                centerTitle: true,
                background: const DecoratedBox(decoration: pubBoxDecoration),
              ),
              leading: SizedBox(
                height: 45,
                width: 45,
                child: InkWell(
                    onTap: () {
                      categoryBloc.quotes.clear();
                      GoRouter.of(context).pop();
                    },
                    borderRadius: BorderRadius.circular(100),
                    child: const Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    )),
              ),
            ),
            CategoryQuotesList(category: category)
          ],
        ),
      ),
    );
  }
}
