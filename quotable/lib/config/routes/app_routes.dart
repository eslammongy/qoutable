abstract class AppRouter {
  static String homeScreen = '/homeScreen';
  static String singleQuoteScreen = '/singleQuoteScreen';
  static String quotesOfAuthorScreen = '/quotesOfAuthorScreen';
  static String quotesOfCategoryScreen = '/quotesOfCategoryScreen';

  static setInitialRoute() async {
    /* static GoRouter appRoutes() {
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
        final quote = state.extra;
        return  const SingleQuoteScreen()
        },
      ),
      GoRoute(
        path: quotesOfCategoryScreen,
        builder: (context, state) {
        final categoryName = state.extra;
        return  const QuotesOfCategoryScreen()
        },
      ),
      GoRoute(
        path: quotesOfAuthorScreen,
        builder: (context, state) {
        final authorName = state.extra;
        return  const QuotesOfCAuthorScreen()
        },
      ),
    
    ]);
  } */
  }
}
