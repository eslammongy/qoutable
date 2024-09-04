import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/widgets/custome_error_widget.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';
import 'package:quotable/features/categories/presentation/bloc/category_bloc.dart';
import 'package:quotable/features/categories/presentation/bloc/category_event.dart';
import 'package:quotable/features/categories/presentation/bloc/category_state.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_list_item.dart';

class CategoryQuotesList extends StatelessWidget {
  const CategoryQuotesList({super.key, required this.category});
  final CategoryEntity category;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesStates>(
      bloc: BlocProvider.of<CategoriesBloc>(context)
        ..add(
          FetchRemoteCategoryQuotesEvent(tag: category.name ?? ''),
        ),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesStateFetchQuotesSuccess) {
          return _displayCategoryQuotes(state.quotes ?? []);
        } else if (state is CategoryStateFailed) {
          return SliverFillRemaining(
            child: Align(
                alignment: Alignment.center,
                child: CustomErrorWidget(failure: state.error!)),
          );
        } else {
          return SliverFillRemaining(
            child: Align(
                alignment: Alignment.center,
                child: displayLoadingWidget(
                    loadingMsg: 'Loading category quotes...')),
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
