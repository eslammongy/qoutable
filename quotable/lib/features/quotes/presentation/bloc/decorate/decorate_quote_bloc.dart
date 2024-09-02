import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_font_toggles.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_theme_toggles.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_state.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_event.dart';

class DecorateQuoteBloc extends Bloc<DecorateQuoteEvents, DecorateQuoteState> {
  DecorateQuoteBloc() : super(const DecorateQuoteInitState()) {
    on<DecorateQuoteThemeEvent>(onChangeQuoteBoxTheme);
    on<DecorateQuoteTextEvent>(onChangeQuoteTextStyle);
  }

  List<Color> selectedThemeColors = toggleGradients[0];
  TextStyle quoteTextStyle = quoteFontStyles[0];

  onChangeQuoteBoxTheme(
    DecorateQuoteThemeEvent event,
    Emitter<DecorateQuoteState> emit,
  ) {
    selectedThemeColors = event.colors;
    debugPrint("Selected Theme Colors: $selectedThemeColors");
    emit(DecorateQuoteThemeState(colors: selectedThemeColors));
  }

  onChangeQuoteTextStyle(
    DecorateQuoteTextEvent event,
    Emitter<DecorateQuoteState> emit,
  ) {
    quoteTextStyle = event.textStyle;
    emit(DecorateQuoteTextState(textStyle: quoteTextStyle));
  }
}
