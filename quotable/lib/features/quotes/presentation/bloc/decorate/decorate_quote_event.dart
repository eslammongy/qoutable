import 'package:flutter/material.dart';

abstract class DecorateQuoteEvents {
  const DecorateQuoteEvents();
}

class DecorateQuoteThemeEvent extends DecorateQuoteEvents {
  final List<Color> colors;
  const DecorateQuoteThemeEvent({required this.colors});
}

class DecorateQuoteTextEvent extends DecorateQuoteEvents {
  final TextStyle textStyle;
  const DecorateQuoteTextEvent({required this.textStyle});
}
