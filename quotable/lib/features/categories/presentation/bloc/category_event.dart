abstract class CategoriesEvents {
  const CategoriesEvents();
}

class FetchRemoteCategoriesEvent extends CategoriesEvents {
  const FetchRemoteCategoriesEvent();
}

class FetchRemoteCategoryQuotesEvent extends CategoriesEvents {
  final String tag;
  const FetchRemoteCategoryQuotesEvent({required this.tag});
}
