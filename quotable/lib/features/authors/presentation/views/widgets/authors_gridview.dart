import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/core/constant/app_assets.dart';
import 'package:quotable/config/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotable/features/authors/domain/entities/author.dart';

class AuthorsGridView extends StatelessWidget {
  const AuthorsGridView({super.key, required this.authors});
  final List<AuthorEntity> authors;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: authors.length,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      itemBuilder: (context, index) {
        return _buildCategoryGridItem(context, index);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }

  InkWell _buildCategoryGridItem(BuildContext context, int index) {
    return InkWell(
        onTap: () {
          GoRouter.of(context).push(
            AppRouter.authorQuotesScreen,
            extra: authors[index],
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
                      width: 50,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      authors[index].name ?? '',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style:
                          TextStyles.font18Bold.copyWith(color: Colors.white),
                    ),
                    Text(
                      "${authors[index].quoteCount}",
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
