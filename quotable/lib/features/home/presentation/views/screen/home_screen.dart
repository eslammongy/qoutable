import 'package:flutter/material.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/core/widgets/home_appbar.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_bloc.dart';
import 'package:quotable/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:quotable/features/quotes/presentation/views/screens/bookmark_list.dart';
import 'package:quotable/features/authors/presentation/views/screens/authors_list.dart';
import 'package:quotable/features/quotes/presentation/views/screens/random_quotes_list.dart';
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
    const AuthorsList(),
    const BookmarkList(),
  ];

  @override
  Widget build(BuildContext context) {
    final appBloc = AppSettingsBloc.get(context);
    final theme = context.theme;
    return Scaffold(
      backgroundColor: theme.appColors.background,
      appBar: homeAppBar(context),
      extendBody: true,
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 30),
        child: screens[appBloc.currentScreeIndex],
      ),
      bottomNavigationBar: FloatingBottomNavBar(
        currentIndex: appBloc.currentScreeIndex,
        getCurrentIndex: (int index) {
          setState(() {
            appBloc.currentScreeIndex = index;
          });
        },
      ),
    );
  }
}
