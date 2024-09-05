import 'package:go_router/go_router.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';
import 'package:quotable/features/categories/domain/entities/category.dart';
import 'package:quotable/features/home/presentation/views/screen/home_screen.dart';
import 'package:quotable/features/quotes/presentation/views/screens/single_quote_screen.dart';
import 'package:quotable/features/authors/presentation/views/screens/author_quotes_screen.dart';
import 'package:quotable/features/categories/presentation/views/screens/category_quotes_screen.dart';

abstract class AppRouter {
  static String homeScreen = '/homeScreen';
  static String singleQuoteScreen = '/singleQuoteScreen';
  static String authorQuotesScreen = '/authorQuotesScreen';
  static String categoryQuotesScreen = '/categoryQuotesScreen';

  static GoRouter appRoutes() {
    return GoRouter(routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomeScreen();
        },
      ),
      GoRoute(
        path: singleQuoteScreen,
        builder: (context, state) {
          final details = state.extra as Map<String, dynamic>;
          return SingleQuoteScreen(
            details: details,
          );
        },
      ),
      GoRoute(
        path: categoryQuotesScreen,
        builder: (context, state) {
          final category = state.extra as CategoryEntity;
          return CategoryQuotesScreen(category: category);
        },
      ),
      GoRoute(
        path: authorQuotesScreen,
        builder: (context, state) {
          final author = state.extra as AuthorEntity;
          return AuthorQuotesScreen(
            author: author,
          );
        },
      ),
    ]);
  }
}
