import 'package:flutter/material.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';

AppBar singleViewAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: context.theme.appColors.background,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    centerTitle: true,
    title: Text(
      title,
      textAlign: TextAlign.start,
      style: TextStyles.font20Bold,
    ),
  );
}
