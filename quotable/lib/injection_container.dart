import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:quotable/features/quotes/data/datasource/quote_api_services.dart';
import 'package:quotable/features/quotes/domain/repository/quote_repository.dart';
import 'package:quotable/features/quotes/data/repository/quote_repository_impl.dart';
import 'package:quotable/features/quotes/domain/usecaces/fetch_remote_quote_usecase.dart';
import 'package:quotable/features/quotes/presentation/bloc/remote/remote_quote_bloc.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  getIt.registerSingleton<Dio>(Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 30),
      responseType: ResponseType.json)));

  // Dependencies
  getIt.registerSingleton<QuoteApiServices>(QuoteApiServices(dio: getIt()));

  getIt.registerSingleton<QuoteRepository>(
      QuoteRepositoryImpl(quoteApiServices: getIt()));

  //UseCases
  getIt.registerSingleton<FetchRemoteQuotesUseCase>(
    FetchRemoteQuotesUseCase(
      quoteRepository: getIt(),
    ),
  );

  //Blocs
  getIt.registerFactory<RemoteQuoteBloc>(() => RemoteQuoteBloc(getIt()));
}
