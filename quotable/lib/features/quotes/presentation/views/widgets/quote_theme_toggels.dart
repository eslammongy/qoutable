import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/features/quotes/presentation/views/widgets/quote_decorated_box.dart';

const toggleGradients = [
  [Color(0xFF5F20F1), Color(0xFFAE0606)],
  [Color(0xFF0061ff), Color(0xFF60efff)],
  [Color(0xFFe9d022), Color(0xFFe60b09)],
  [Color(0xFF8752a3), Color(0xFF6274e7)],
  [Color(0xFF08203e), Color(0xFF557c93)],
];

class QuoteThemeToggles extends StatelessWidget {
  const QuoteThemeToggles({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final selectedColor = ValueNotifier(theme.primaryColor.value);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Theme",
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600, letterSpacing: 1.2),
        ),
        _buildAccentColorBtn(
          toggleGradients[0],
          selectedColor.value == theme.primaryColor.value,
          onTap: () => quoteDecoratedBoxKey.currentState
              ?.changeQuoteBoxTheme(toggleGradients[0]),
        ),
        _buildAccentColorBtn(
          toggleGradients[1],
          selectedColor.value == Colors.purple.value,
          onTap: () => quoteDecoratedBoxKey.currentState
              ?.changeQuoteBoxTheme(toggleGradients[1]),
        ),
        _buildAccentColorBtn(
          toggleGradients[2],
          selectedColor.value == Colors.green.value,
          onTap: () => quoteDecoratedBoxKey.currentState
              ?.changeQuoteBoxTheme(toggleGradients[2]),
        ),
        _buildAccentColorBtn(
          toggleGradients[3],
          selectedColor.value == Colors.green.value,
          onTap: () => quoteDecoratedBoxKey.currentState
              ?.changeQuoteBoxTheme(toggleGradients[3]),
        ),
        _buildAccentColorBtn(
          toggleGradients[4],
          selectedColor.value == Colors.teal.value,
          onTap: () => quoteDecoratedBoxKey.currentState
              ?.changeQuoteBoxTheme(toggleGradients[4]),
        )
      ],
    );
  }

  _buildAccentColorBtn(List<Color> colors, bool isSelected,
      {Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: customizedDecorationBox(colors, radius: 100),
        child: const Padding(
          padding: EdgeInsets.all(2.0),
          child: SizedBox(
            height: 30,
            width: 30,
          ),
        ),
      ),
    );
  }
}
