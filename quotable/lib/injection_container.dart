import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quotable/core/utils/internet_checker_service.dart';
import 'package:quotable/features/home/domain/usecaces/change_app_theme.dart';
import 'package:quotable/features/home/domain/repository/app_settings_repo.dart';
import 'package:quotable/features/home/presentation/bloc/app_settings_bloc.dart';
import 'package:quotable/features/quotes/data/datasource/quote_api_services.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';
import 'package:quotable/features/quotes/data/repository/quote_repository_impl.dart';
import 'package:quotable/features/home/data/repository/app_settings_repository_impl.dart';
import 'package:quotable/features/quotes/domain/usecaces/fetch_remote_quote_usecase.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  getIt.registerSingleton<InternetChecker>(InternetChecker.init());
  // Dio
  getIt.registerLazySingleton<Dio>(() => Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json)));

  // Dependencies
  getIt.registerLazySingleton<QuoteApiServices>(
      () => QuoteApiServices(dio: getIt()));

  getIt.registerLazySingleton<QuoteRepository>(
      () => QuoteRepositoryImpl(quoteApiServices: getIt()));

  getIt.registerLazySingleton<AppSettingsRepo>(
      () => AppSettingsRepositoryImpl());

  //UseCases
  getIt.registerLazySingleton<FetchRemoteQuotesUseCase>(
    () => FetchRemoteQuotesUseCase(
      quoteRepository: getIt(),
    ),
  );

  getIt.registerLazySingleton<ChangeAppThemeUseCase>(
    () => ChangeAppThemeUseCase(
      appSettingsRepo: getIt(),
    ),
  );

  //Blocs
  getIt.registerFactory<RemoteQuoteBloc>(() => RemoteQuoteBloc(getIt()));
  getIt.registerFactory<AppSettingsBloc>(
      () => AppSettingsBloc(changeAppTheme: getIt()));
  getIt.registerFactory<DecorateQuoteBloc>(() => DecorateQuoteBloc());
}
