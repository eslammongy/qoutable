import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotable/features/quotes/domain/entities/quote.dart';

class BookmarkListItem extends StatelessWidget {
  const BookmarkListItem({
    super.key,
    required this.quote,
    this.onTap,
  });
  final QuoteEntity quote;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: DecoratedBox(
        decoration: quoteBoxDecoration(context),
        child: Card(
          color: context.theme.appColors.surface,
          margin: const EdgeInsets.all(2),
          elevation: 2,
          child: SizedBox(
            height: 90.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                    top: 10,
                    bottom: 0,
                    right: 10,
                    child: Text(
                      quote.content!,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      style: TextStyles.font14Regular,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 0,
                    top: 20,
                    child: InkWell(
                      onTap: onTap,
                      child: Card(
                        color: context.theme.appColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        elevation: 0,
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
