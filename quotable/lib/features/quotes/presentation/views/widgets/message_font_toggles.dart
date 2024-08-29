import 'package:flutter/material.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageFontToggles extends StatelessWidget {
  const MessageFontToggles({super.key});

  @override
  Widget build(BuildContext context) {
    const msgFont = " settingsCubit.msgFont";
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Msg Font",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
          ),
        ),
        _buildMsgFontBtn(context, theme, msgFont == cairoFM, cairoFM),
        _buildMsgFontBtn(context, theme, msgFont == ubuntuSans, ubuntuSans),
        _buildMsgFontBtn(
            context, theme, msgFont == dancingScript, dancingScript),
        _buildMsgFontBtn(context, theme, msgFont == chakraPatch, chakraPatch),
      ],
    );
  }

  _buildMsgFontBtn(BuildContext context, ThemeData theme, bool isSelected,
      String fontFamily) {
    return InkWell(
      onTap: () {
        //settingsCubit.changeMsgFontFamily(fontFamily);
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.fromBorderSide(
              isSelected
                  ? const BorderSide(width: 2, color: Colors.grey)
                  : BorderSide.none,
            )),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 25.w,
            width: 25.w,
            child: Text("Aa",
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                    fontFamily: fontFamily,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? theme.colorScheme.secondary : null)),
          ),
        ),
      ),
    );
  }
}
