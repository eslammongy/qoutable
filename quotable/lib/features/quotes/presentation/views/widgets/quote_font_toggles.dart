import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/core/constant/constant.dart';

final quoteFontStyles = {
  1: GoogleFonts.getFont(fmCairo),
  2: GoogleFonts.getFont(fmKanit),
  3: GoogleFonts.getFont(fmRoboto),
  4: GoogleFonts.getFont(fmRobotoSlab),
  5: GoogleFonts.getFont(fmLora),
};

class QuoteFontToggles extends StatelessWidget {
  const QuoteFontToggles({super.key});

  @override
  Widget build(BuildContext context) {
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
          onTap: () {},
        ),
        _buildMsgFontBtn(
          theme,
          false,
          quoteFontStyles[2]!,
          onTap: () {},
        ),
        _buildMsgFontBtn(
          theme,
          true,
          quoteFontStyles[3]!,
          onTap: () {},
        ),
        _buildMsgFontBtn(
          theme,
          false,
          quoteFontStyles[4]!,
          onTap: () {},
        ),
        _buildMsgFontBtn(
          theme,
          true,
          quoteFontStyles[5]!,
          onTap: () {},
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
