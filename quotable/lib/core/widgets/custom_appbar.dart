import 'package:flutter/material.dart';
import 'package:quotable/core/constant/strings.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';

AppBar customAppBar(ThemeData theme) {
  return AppBar(
    backgroundColor: theme.appColors.background,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15), bottomRight: Radius.circular(15))),
    title: Row(
      children: [
        Image.asset(
          AppAssets.quotes,
          width: 32,
        ),
        const SizedBox(width: 8),
        Text(
          kAppName,
          textAlign: TextAlign.start,
          style: TextStyles.font20Bold,
        ),
      ],
    ),
    actions: [
      IconButton(onPressed: () {}, icon: const Icon(Icons.brightness_4_rounded))
    ],
  );
}
