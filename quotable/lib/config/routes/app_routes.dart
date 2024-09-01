import 'package:go_router/go_router.dart';
import 'package:quotable/features/home/presentation/views/screen/home_screen.dart';
import 'package:quotable/features/quotes/presentation/views/screens/random_quotes_list.dart';
import 'package:quotable/features/quotes/presentation/views/screens/single_quote_screen.dart';

abstract class AppRouter {
  static String homeScreen = '/homeScreen';
  static String singleQuoteScreen = '/singleQuoteScreen';
  static String quotesOfAuthorScreen = '/quotesOfAuthorScreen';
  static String quotesOfCategoryScreen = '/quotesOfCategoryScreen';

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
          final quote = fakeQuote();
          return SingleQuoteScreen(
            quote: quote,
          );
        },
      ),
      /*  GoRoute(
        path: quotesOfCategoryScreen,
        builder: (context, state) {
        final categoryName = state.extra;
        return  const QuotesOfCategoryScreen();
        },
      ),
      GoRoute(
        path: quotesOfAuthorScreen,
        builder: (context, state) {
        final authorName = state.extra;
        return  const QuotesOfCAuthorScreen();
        },
      ),
     */
    ]);
  }
}
