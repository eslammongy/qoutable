import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class DecorateQuoteState extends Equatable {
  final List<Color>? colors;
  final TextStyle? textStyle;

  const DecorateQuoteState({this.colors, this.textStyle});

  @override
  List<Object> get props => [colors!, textStyle!];
}

class DecorateQuoteInitState extends DecorateQuoteState {
  const DecorateQuoteInitState();
}

class DecorateQuoteThemeState extends DecorateQuoteState {
  const DecorateQuoteThemeState({required List<Color> colors})
      : super(colors: colors);
}

class DecorateQuoteTextState extends DecorateQuoteState {
  const DecorateQuoteTextState({required TextStyle textStyle})
      : super(textStyle: textStyle);
}
