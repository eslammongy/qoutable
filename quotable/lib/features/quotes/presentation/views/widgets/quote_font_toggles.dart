import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_event.dart';

final quoteFontStyles = {
  1: robotoFontStyle,
  2: kanitFontStyle,
  3: cairoFontStyle,
  4: robotoSlabFontStyle,
  5: loraFontStyle,
};

class QuoteFontToggles extends StatelessWidget {
  const QuoteFontToggles({super.key});

  @override
  Widget build(BuildContext context) {
    final decoratedBloc = BlocProvider.of<DecorateQuoteBloc>(context);
    final theme = context.theme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Font",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 2),
        _buildMsgFontBtn(
          theme,
          true,
          quoteFontStyles[1]!,
          onTap: () => decoratedBloc
              .add(DecorateQuoteTextEvent(textStyle: quoteFontStyles[1]!)),
        ),
        _buildMsgFontBtn(
          theme,
          false,
          quoteFontStyles[2]!,
          onTap: () => decoratedBloc
              .add(DecorateQuoteTextEvent(textStyle: quoteFontStyles[2]!)),
        ),
        _buildMsgFontBtn(
          theme,
          true,
          quoteFontStyles[3]!,
          onTap: () => decoratedBloc
              .add(DecorateQuoteTextEvent(textStyle: quoteFontStyles[3]!)),
        ),
        _buildMsgFontBtn(
          theme,
          false,
          quoteFontStyles[4]!,
          onTap: () => decoratedBloc
              .add(DecorateQuoteTextEvent(textStyle: quoteFontStyles[4]!)),
        ),
        _buildMsgFontBtn(
          theme,
          true,
          quoteFontStyles[5]!,
          onTap: () => decoratedBloc
              .add(DecorateQuoteTextEvent(textStyle: quoteFontStyles[5]!)),
        ),
      ],
    );
  }

  _buildMsgFontBtn(
    ThemeData theme,
    bool isSelected,
    TextStyle style, {
    Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        height: 40,
        width: 60,
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(
                  color: isSelected ? theme.primaryColor : Colors.transparent)),
          child: Center(
            child: Text(
              "Font",
              style: style.copyWith(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
