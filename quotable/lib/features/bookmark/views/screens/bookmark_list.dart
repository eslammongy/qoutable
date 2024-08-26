import 'package:flutter/material.dart';
import 'package:quotable/features/bookmark/views/widgets/bookmark_list_item.dart';

class BookmarkList extends StatelessWidget {
  const BookmarkList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: const BookmarkListItem());
      },
    );
  }
}
