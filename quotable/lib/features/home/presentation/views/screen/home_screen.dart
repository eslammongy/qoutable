import 'package:flutter/material.dart';
import 'package:quotable/core/constant/strings.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/core/widgets/custom_appbar.dart';
import 'package:quotable/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:quotable/features/authors/presentation/views/screens/authors_list.dart';
import 'package:quotable/features/bookmark/presentation/views/screens/bookmark_list.dart';
import 'package:quotable/features/random/presentation/views/screens/random_quotes_list.dart';
import 'package:quotable/features/categories/presentation/views/screens/categories_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    const RandomQuotesList(),
    const CategoriesList(),
    const BookmarkList(),
    const AuthorsList(),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      backgroundColor: theme.appColors.background,
      appBar: customAppBar(theme),
      extendBody: true,
      body: screens[_currentIndex],
      bottomNavigationBar: FloatingBottomNavBar(
        currentIndex: _currentIndex,
        getCurrentIndex: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
