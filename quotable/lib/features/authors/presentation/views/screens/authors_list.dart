import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/core/widgets/custom_error_widget.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_bloc.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_event.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_state.dart';
import 'package:quotable/features/authors/presentation/views/widgets/authors_gridview.dart';

class AuthorsList extends StatelessWidget {
  const AuthorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final authorsBloc = BlocProvider.of<AuthorsBloc>(context);
    return BlocConsumer<AuthorsBloc, AuthorsStates>(
      bloc: authorsBloc..add(const FetchRemoteAuthorsEvent()),
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthorsStateSuccess || authorsBloc.authors.isNotEmpty) {
          return AuthorsGridView(
            authors: state.authors ?? authorsBloc.authors,
          );
        } else if (state is AuthorsStateFailed) {
          return CustomErrorWidget(
            failure: state.error!,
            onPressed: () {
              authorsBloc.add(const FetchRemoteAuthorsEvent());
            },
          );
        } else {
          return displayLoadingWidget(loadingMsg: loadingMsg);
        }
      },
    );
  }
}
