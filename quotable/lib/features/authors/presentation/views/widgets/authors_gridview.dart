import 'package:flutter/material.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/authors/presentation/views/widgets/author_grid_item.dart';

class AuthorsGridView extends StatelessWidget {
  const AuthorsGridView({
    super.key,
    required this.authors,
    this.controller,
    required this.isLoadingMore,
  });
  final List<AuthorEntity> authors;
  final ScrollController? controller;
  final bool isLoadingMore;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      itemCount: authors.length +
          (isLoadingMore
              ? 1
              : 0), // Add one more item for the loading indicator
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      itemBuilder: (context, index) {
        if (index == authors.length) {
          // Show loading indicator at the end
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return AuthorGridItem(author: authors[index]);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
