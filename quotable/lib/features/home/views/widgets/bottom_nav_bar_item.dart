import 'package:flutter/material.dart';
import '../../../../core/theme/text_style.dart';
import 'package:quotable/core/theme/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isActive;
  final Function()? onTap;

  const BottomNavItem({
    super.key,
    required this.title,
    required this.icon,
    required this.isActive,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final activeColor = context.theme.appColors.primary;

    return InkWell(
      borderRadius: BorderRadius.circular(100),
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color:
                isActive ? activeColor.withOpacity(0.45) : Colors.transparent,
            elevation: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: FaIcon(icon,
                  size: 18, color: isActive ? Colors.white : Colors.grey),
            ),
          ),
          if (isActive)
            Text(
              title,
              style: TextStyles.font13SemiBold.copyWith(
                color: context.theme.appColors.onSurface,
                letterSpacing: 1.2,
              ),
            )
        ],
      ),
    );
  }
}
