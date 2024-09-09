import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/local/local_quote_state.dart';
import 'package:quotable/features/quotes/domain/usecaces/save_quote_locally_usecase.dart';
import 'package:quotable/features/quotes/domain/usecaces/get_favorite_quotes_usecase.dart';
import 'package:quotable/features/quotes/domain/usecaces/delete_quote_locally_usecase.dart';

class LocalQuoteBloc extends Bloc<LocalQuotesEvents, LocalQuoteStates> {
  final GetFavoriteQuotesUsecase getFavoriteQuotesUsecase;
  final SaveQuoteLocallyUsecase saveQuoteLocallyUsecase;
  final DeleteQuoteLocallyUsecase deleteQuoteLocallyUsecase;

  static LocalQuoteBloc get(context) => BlocProvider.of(context);

  LocalQuoteBloc(
    this.getFavoriteQuotesUsecase,
    this.saveQuoteLocallyUsecase,
    this.deleteQuoteLocallyUsecase,
  ) : super(const LocalQuoteInitState()) {
    on<FetchLocalQuotesEvent>(onFetchLocalQuotesUseCase);
    on<SaveLocalQuotesEvent>(onSaveQuoteLocallyUseCase);
    on<DeleteLocalQuotesEvent>(onDeleteQuoteLocallyUseCase);
    on<ResetLocalQuoteStateEvent>(onResetLocalQuotesState);
  }

  List<QuoteEntity> quotes = [];
  onFetchLocalQuotesUseCase(
    FetchLocalQuotesEvent event,
    Emitter<LocalQuoteStates> emit,
  ) async {
    if (quotes.isNotEmpty) return;
    emit(const LocalQuoteLoadingState());
    try {
      final quotes = await getFavoriteQuotesUsecase();
      if (quotes.isNotEmpty) {
        this.quotes = quotes;
        emit(LocalQuotesLoadedState(quotes: quotes));
      } else {
        emit(const LocalQuoteFailed(msg: "There is no quotes saved yet"));
      }
    } catch (e) {
      emit(LocalQuoteFailed(msg: "$e"));
    }
  }

  onSaveQuoteLocallyUseCase(
    SaveLocalQuotesEvent event,
    Emitter<LocalQuoteStates> emit,
  ) async {
    try {
      final params = event.quote.copyWith(isBookmarked: true);
      final quoteId = await saveQuoteLocallyUsecase.call(params: params);
      emit(LocalQuotesSaveState(quoteId: quoteId));
    } catch (e) {
      emit(LocalQuoteFailed(msg: "$e"));
    }
  }

  onResetLocalQuotesState(
    ResetLocalQuoteStateEvent event,
    Emitter<LocalQuoteStates> emit,
  ) async {
    emit(const LocalQuoteInitState());
  }

  onDeleteQuoteLocallyUseCase(
    DeleteLocalQuotesEvent event,
    Emitter<LocalQuoteStates> emit,
  ) async {
    try {
      await deleteQuoteLocallyUsecase
          .call(params: event.quote.id)
          .then((value) {
        event.quote.isBookmarked = false;
        quotes.removeWhere(
          (element) => element.id == event.quote.id,
        );
      });
      emit(const LocalQuotesDeleteState());
    } catch (e) {
      emit(LocalQuoteFailed(msg: "$e"));
    }
  }
}
