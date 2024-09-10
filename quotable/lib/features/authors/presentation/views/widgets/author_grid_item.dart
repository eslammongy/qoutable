import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/config/routes/app_routes.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';

class AuthorGridItem extends StatelessWidget {
  const AuthorGridItem({
    super.key,
    required this.author,
  });

  final AuthorEntity author;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.authorQuotesScreen,
            extra: author,
          );
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 100.h,
            width: 60.w,
            child: DecoratedBox(
              decoration: pubBoxDecoration,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.authorSvgIcon,
                      width: 40,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      author.name ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyles.font18Bold.copyWith(color: Colors.white),
                    ),
                    Text(
                      "${author.quoteCount}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyles.font14Regular
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
