import 'package:flutter/material.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          "Accent Color",
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600, letterSpacing: 1.2),
        ),
        _buildAccentColorBtn(
          context,
          theme.primaryColor,
          selectedColor.value == theme.primaryColor.value,
        ),
        _buildAccentColorBtn(
          context,
          Colors.purple,
          selectedColor.value == Colors.purple.value,
        ),
        _buildAccentColorBtn(
          context,
          Colors.green,
          selectedColor.value == Colors.green.value,
        ),
        _buildAccentColorBtn(
          context,
          Colors.teal,
          selectedColor.value == Colors.teal.value,
        )
      ],
    );
  }

  _buildAccentColorBtn(BuildContext context, Color color, bool isSelected) {
    return InkWell(
      onTap: () {},
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.fromBorderSide(
              isSelected
                  ? const BorderSide(width: 2, color: Colors.grey)
                  : BorderSide.none,
            )),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            color: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: SizedBox(
              height: 22.w,
              width: 22.w,
            ),
          ),
        ),
      ),
    );
  }
}
