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
  });
  final QuoteEntity quote;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: pubBoxDecoration,
      child: Card(
        color: context.theme.appColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: const EdgeInsets.all(2),
        elevation: 0,
        child: SizedBox(
          height: 80.h,
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
                  top: 0,
                  bottom: 0,
                  right: 80,
                  child: Text(
                    quote.content!,
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
                            width: 2, color: context.theme.appColors.primary)),
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 4),
                      child: Text(
                        quote.author!,
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
      ),
    );
  }
}
