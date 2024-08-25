import 'package:flutter/material.dart';
import 'package:quotable/core/utils/helper.dart';
import 'package:quotable/core/theme/text_style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            onTap: () {},
            child: DecoratedBox(
                decoration: pubBoxDecoration,
                child: SizedBox(
                  height: 100.h,
                  width: 60.w,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Productivity",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        textAlign: TextAlign.center,
                        style: TextStyles.font18Bold,
                      ),
                    ),
                  ),
                )));
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
