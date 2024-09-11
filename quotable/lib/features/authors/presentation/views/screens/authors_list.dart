import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/core/widgets/custom_error_widget.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_bloc.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_event.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_state.dart';
import 'package:quotable/features/authors/presentation/views/widgets/authors_gridview.dart';

class AuthorsList extends StatefulWidget {
  const AuthorsList({super.key});

  @override
  State<AuthorsList> createState() => _AuthorsListState();
}

class _AuthorsListState extends State<AuthorsList> {
  final ScrollController _scrollController = ScrollController();
  late final AuthorsBloc authorsBloc;

  @override
  void initState() {
    super.initState();
    authorsBloc = AuthorsBloc.get(context);
    authorsBloc.add(const FetchRemoteAuthorsEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthorsBloc, AuthorsStates>(
      builder: (context, state) {
        if (state is AuthorsStateSuccess) {
          return AuthorsGridView(
            authors: state.authors ?? authorsBloc.authors,
            controller: _scrollController,
            isLoadingMore: authorsBloc.isFetching &&
                authorsBloc.currentPage > 1, // Check if loading more
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

  void _onScroll() {
    // Only fetch if not already fetching, more authors exist, and near bottom of list
    final bool shouldFetching =
        !authorsBloc.isFetching && authorsBloc.hasMoreAuthors;
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200 &&
        shouldFetching) {
      authorsBloc.add(const FetchRemoteAuthorsEvent());
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Clean up the controller
    super.dispose();
  }
}
