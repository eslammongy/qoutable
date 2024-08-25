import 'package:flutter/material.dart';
import 'package:quotable/core/theme/app_theme.dart';
import 'package:quotable/core/constant/strings.dart';
import 'package:quotable/core/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/features/home/views/widgets/bottom_nav_bar.dart';
import 'package:quotable/features/bookmark/views/screens/bookmark_list.dart';
import 'package:quotable/features/random/views/screens/random_quotes_list.dart';
import 'package:quotable/features/categories/views/screens/categories_list.dart';

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
    const Text("data"),
  ];
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final theme = context.theme.appColors;
    return Scaffold(
      backgroundColor: theme.background,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        title: Row(
          children: [
            Image.asset(
              AppAssets.quotes,
              width: 32,
            ),
            const SizedBox(width: 8),
            Text(
              kAppName,
              textAlign: TextAlign.start,
              style: TextStyles.font20Bold,
            ),
          ],
        ),
        backgroundColor: theme.background,
      ),
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
