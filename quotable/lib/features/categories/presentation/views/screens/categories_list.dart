import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/features/categories/presentation/bloc/category_bloc.dart';
import 'package:quotable/features/categories/presentation/bloc/category_event.dart';
import 'package:quotable/features/categories/presentation/bloc/category_state.dart';
import 'package:quotable/features/categories/presentation/views/widgets/categories_gridview.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoriesBloc, CategoriesStates>(
      bloc: BlocProvider.of<CategoriesBloc>(context)
        ..add(
          const FetchRemoteCategoriesEvent(),
        ),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is CategoriesStateSuccess) {
          return CategoriesGridView(categories: state.categories ?? []);
        } else if (state is CategoryStateFailed) {
          return displayErrorWidget(context, state.error!);
        } else {
          return displayLoadingWidget(loadingMsg: loadingMsg);
        }
      },
    );
  }
}
