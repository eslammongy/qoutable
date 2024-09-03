import 'package:flutter/material.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';

class CustomQuoteBtn extends StatelessWidget {
  const CustomQuoteBtn(
      {super.key,
      this.onTap,
      required this.text,
      this.hasBorder = true,
      this.textColor = Colors.white});
  final Function()? onTap;
  final String text;
  final bool hasBorder;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        color: hasBorder ? Colors.transparent : context.theme.appColors.primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: hasBorder
                ? BorderSide(color: context.theme.appColors.primary, width: 2)
                : BorderSide.none),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: TextStyles.font15Medium.copyWith(color: textColor),
          ),
        ),
      ),
    );
  }
}
