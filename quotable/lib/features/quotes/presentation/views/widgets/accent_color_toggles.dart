import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';

class AccentColorToggles extends StatelessWidget {
  const AccentColorToggles({super.key});

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
          [const Color(0xFF5F20F1), const Color(0xFFAE0606)],
          selectedColor.value == theme.primaryColor.value,
        ),
        _buildAccentColorBtn(
          [const Color(0xFFe9d022), const Color(0xFFe60b09)],
          selectedColor.value == Colors.purple.value,
        ),
        _buildAccentColorBtn(
          [const Color(0xFF0061ff), const Color(0xFF60efff)],
          selectedColor.value == Colors.green.value,
        ),
        _buildAccentColorBtn(
          [const Color(0xFF8752a3), const Color(0xFF6274e7)],
          selectedColor.value == Colors.green.value,
        ),
        _buildAccentColorBtn(
          [const Color(0xFF60efff), const Color(0xFF00ff87)],
          selectedColor.value == Colors.teal.value,
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
