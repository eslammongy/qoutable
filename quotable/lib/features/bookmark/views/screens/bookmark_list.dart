import 'package:flutter/material.dart';
import 'package:quotable/core/theme/app_theme.dart';
import 'package:quotable/core/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookmarkList extends StatelessWidget {
  const BookmarkList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: Card(
              color: context.theme.appColors.surface,
              elevation: 2,
              child: SizedBox(
                height: 80.h,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        child: Image.asset(
                          AppAssets.quotes,
                          width: 32,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Positioned(
                        left: 40,
                        top: 0,
                        bottom: 0,
                        right: 40,
                        child: Text(
                          "Hell, there are no rules here-- we're trying to accomplish something. Hell, there are no rules here-- we're trying to accomplish something. Hell, there are no rules here-- we're trying to accomplish something.",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          textAlign: TextAlign.start,
                          style: TextStyles.font14Regular,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Card(
                          color: context.theme.appColors.surface,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                  width: 2,
                                  color: context.theme.appColors.primary)),
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 4),
                            child: Text(
                              "2023-04-14",
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                              textAlign: TextAlign.start,
                              style: TextStyles.font14Regular,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
