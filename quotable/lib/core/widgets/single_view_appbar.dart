import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/core/constant/constant.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';

AppBar singleViewAppBar(BuildContext context,
    {Function()? actionOnTap, bool isBookmark = false}) {
  return AppBar(
    backgroundColor: context.theme.appColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
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
    leading: SizedBox(
      height: 45,
      width: 45,
      child: InkWell(
          onTap: () => GoRouter.of(context).pop(),
          borderRadius: BorderRadius.circular(100),
          child: const Icon(Icons.arrow_back_ios_rounded)),
    ),
    actions: [
      SizedBox(
        height: 45,
        width: 45,
        child: InkWell(
            onTap: actionOnTap,
            borderRadius: BorderRadius.circular(100),
            child: Icon(
              isBookmark
                  ? Icons.bookmark_add_rounded
                  : Icons.bookmark_add_outlined,
              size: 30,
            )),
      )
    ],
  );
}
