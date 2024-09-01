import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/config/theme/text_style.dart';
import 'package:quotable/config/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.quotesOfCategoryScreen,
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
                        const Icon(
                          FontAwesomeIcons.layerGroup,
                          size: 35,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Productivity",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyles.font18Bold
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          "30 Quotes",
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
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
    );
  }
}
