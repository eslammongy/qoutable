import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_bloc.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_event.dart';
import 'package:quotable/features/quotes/presentation/bloc/decorate/decorate_quote_state.dart';

final quoteFontStyles = [
  montserratFontStyle,
  robotoMonoFontStyle,
  cairoFontStyle,
  robotoSlabFontStyle,
  nerkoOneFontStyle,
];

class QuoteFontToggles extends StatelessWidget {
  const QuoteFontToggles({super.key});

  @override
  Widget build(BuildContext context) {
    final decoratedBloc = BlocProvider.of<DecorateQuoteBloc>(context);
    final theme = context.theme;

    return BlocBuilder<DecorateQuoteBloc, DecorateQuoteState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              fontTxt,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 2),
            _buildFontToggleItem(
              theme,
              quoteFontStyles[0] == decoratedBloc.quoteTextStyle,
              quoteFontStyles[0],
              onTap: () => decoratedBloc.add(
                DecorateQuoteTextEvent(textStyle: quoteFontStyles[0]),
              ),
            ),
            _buildFontToggleItem(
              theme,
              quoteFontStyles[1] == decoratedBloc.quoteTextStyle,
              quoteFontStyles[1],
              onTap: () => decoratedBloc.add(
                DecorateQuoteTextEvent(textStyle: quoteFontStyles[1]),
              ),
            ),
            _buildFontToggleItem(
              theme,
              quoteFontStyles[2] == decoratedBloc.quoteTextStyle,
              quoteFontStyles[2],
              onTap: () => decoratedBloc.add(
                DecorateQuoteTextEvent(textStyle: quoteFontStyles[2]),
              ),
            ),
            _buildFontToggleItem(
              theme,
              quoteFontStyles[3] == decoratedBloc.quoteTextStyle,
              quoteFontStyles[3],
              onTap: () => decoratedBloc.add(
                DecorateQuoteTextEvent(textStyle: quoteFontStyles[3]),
              ),
            ),
            _buildFontToggleItem(
              theme,
              quoteFontStyles[4] == decoratedBloc.quoteTextStyle,
              quoteFontStyles[4],
              onTap: () => decoratedBloc.add(
                DecorateQuoteTextEvent(textStyle: quoteFontStyles[4]),
              ),
            ),
          ],
        );
      },
    );
  }

  _buildFontToggleItem(
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
                  width: 2,
                  color: isSelected ? Colors.grey : Colors.transparent)),
          child: Center(
            child: Text(
              fontTxt,
              style: style.copyWith(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
