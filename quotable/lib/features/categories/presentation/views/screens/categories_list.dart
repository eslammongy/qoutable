import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/core/widgets/custom_error_widget.dart';
import 'package:quotable/features/categories/presentation/bloc/category_bloc.dart';
import 'package:quotable/features/categories/presentation/bloc/category_event.dart';
import 'package:quotable/features/categories/presentation/bloc/category_state.dart';
import 'package:quotable/features/categories/presentation/views/widgets/categories_gridview.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryBloc = BlocProvider.of<CategoriesBloc>(context);
    return BlocConsumer<CategoriesBloc, CategoriesStates>(
      bloc: categoryBloc..add(const FetchRemoteCategoriesEvent()),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesStateSuccess ||
            categoryBloc.categories.isNotEmpty) {
          return CategoriesGridView(
            categories: state.categories ?? categoryBloc.categories,
          );
        } else if (state is CategoryStateFailed) {
          return CustomErrorWidget(
            failure: state.error!,
            onPressed: () {
              categoryBloc.add(const FetchRemoteCategoriesEvent());
            },
          );
        } else {
          return displayLoadingWidget(loadingMsg: loadingMsg);
        }
      },
    );
  }
}
