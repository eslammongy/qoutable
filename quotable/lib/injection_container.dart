import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quotable/core/utils/user_pref.dart';
import 'package:quotable/features/quotes/data/datasource/quote_box_db.dart';
import 'package:quotable/features/home/domain/usecaces/change_app_theme.dart';
import 'package:quotable/features/authors/presentation/bloc/authors_bloc.dart';
import 'package:quotable/features/home/domain/repository/app_settings_repo.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_bloc.dart';
import 'package:quotable/features/quotes/data/datasource/quote_api_services.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';
import 'package:quotable/features/home/domain/usecaces/get_app_theme_usecase.dart';
import 'package:quotable/features/categories/presentation/bloc/category_bloc.dart';
import 'package:quotable/features/authors/data/datasource/authors_api_service.dart';
import 'package:quotable/features/authors/domain/repository/authors_repository.dart';
import 'package:quotable/features/quotes/data/repository/quote_repository_impl.dart';
import 'package:quotable/features/authors/data/repository/authors_repository_impl.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_bloc.dart';
import 'package:quotable/features/categories/domain/repository/category_repository.dart';
import 'package:quotable/features/categories/data/datasource/category_api_services.dart';
import 'package:quotable/features/authors/domain/usecaces/fetch_all_authors_usecase.dart';
import 'package:quotable/features/home/data/repository/app_settings_repository_impl.dart';
import 'package:quotable/features/quotes/domain/usecaces/fetch_remote_quote_usecase.dart';
import 'package:quotable/features/quotes/domain/usecaces/save_quote_locally_usecase.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_bloc.dart';
import 'package:quotable/features/quotes/domain/usecaces/get_favorite_quotes_usecase.dart';
import 'package:quotable/features/quotes/domain/usecaces/delete_quote_locally_usecase.dart';
import 'package:quotable/features/authors/domain/usecaces/fetch_author_quotes_usecase.dart';
import 'package:quotable/features/categories/domain/usecaces/fetch_categories_usecase.dart';
import 'package:quotable/features/categories/data/repository/category_repository_impl.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_bloc.dart';
import 'package:quotable/features/categories/domain/usecaces/fetch_category_quotes_usecase.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  await SharedPref.init();
  final objectBoxDb = await ObjectBoxDB.create();
  //** Dio */
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json)));

  //** Api services */
  getIt.registerLazySingleton<QuoteApiServices>(
      () => QuoteApiServices(dio: getIt()));

  getIt.registerLazySingleton<ObjectBoxDB>(() => objectBoxDb);

  getIt.registerLazySingleton<CategoryApiServices>(
      () => CategoryApiServices(dio: getIt()));

  getIt.registerLazySingleton<AuthorsApiService>(
      () => AuthorsApiService(dio: getIt()));

  //** Repositories */
  getIt.registerLazySingleton<QuoteRepository>(() =>
      QuoteRepositoryImpl(quoteApiServices: getIt(), objectBoxDB: getIt()));

  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(apiService: getIt()));

  getIt.registerLazySingleton<AppSettingsRepo>(
      () => AppSettingsRepositoryImpl());

  getIt.registerLazySingleton<AuthorsRepository>(
      () => AuthorsRepositoryImpl(apiService: getIt()));

  //** UseCases */
  getIt.registerLazySingleton<FetchRemoteQuotesUseCase>(
    () => FetchRemoteQuotesUseCase(
      quoteRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<FetchCategoriesUseCase>(
    () => FetchCategoriesUseCase(
      categoryRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<FetchCategoryQuotesUseCase>(
    () => FetchCategoryQuotesUseCase(
      categoryRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<FetchAllAuthorsUsecase>(
    () => FetchAllAuthorsUsecase(
      authorsRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<FetchAuthorQuotesUsecase>(
    () => FetchAuthorQuotesUsecase(
      authorsRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<ChangeAppThemeUseCase>(
    () => ChangeAppThemeUseCase(
      appSettingsRepo: getIt(),
    ),
  );
  getIt.registerLazySingleton<SetAppThemeUseCase>(
    () => SetAppThemeUseCase(
      appSettingsRepo: getIt(),
    ),
  );

  getIt.registerLazySingleton<GetFavoriteQuotesUsecase>(
    () => GetFavoriteQuotesUsecase(
      quoteRepository: getIt(),
    ),
  );
  getIt.registerLazySingleton<SaveQuoteLocallyUsecase>(
    () => SaveQuoteLocallyUsecase(
      quoteRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<DeleteQuoteLocallyUsecase>(
    () => DeleteQuoteLocallyUsecase(
      quoteRepository: getIt(),
    ),
  );

  //** Blocs */
  getIt.registerFactory<RemoteQuoteBloc>(() => RemoteQuoteBloc(getIt()));

  getIt.registerFactory<AppSettingsBloc>(() => AppSettingsBloc(
        changeAppThemeUseCase: getIt(),
        setAppThemeUseCase: getIt(),
      ));

  getIt.registerFactory<CategoriesBloc>(() => CategoriesBloc(
        getIt(),
        getIt(),
      ));

  getIt.registerFactory<AuthorsBloc>(() => AuthorsBloc(
        getIt(),
        getIt(),
      ));

  getIt.registerFactory<LocalQuoteBloc>(() => LocalQuoteBloc(
        getIt(),
        getIt(),
        getIt(),
      ));

  getIt.registerFactory<DecorateQuoteBloc>(() => DecorateQuoteBloc());
}
