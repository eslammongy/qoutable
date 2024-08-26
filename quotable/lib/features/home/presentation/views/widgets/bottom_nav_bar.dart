import 'bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:quotable/core/constant/strings.dart';
import 'package:quotable/config/theme/app_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef GetCurrentIndex = void Function(int index);

class FloatingBottomNavBar extends StatelessWidget {
  final Function()? onAddBtnTap;
  final GetCurrentIndex getCurrentIndex;
  final int currentIndex;
  const FloatingBottomNavBar({
    super.key,
    this.onAddBtnTap,
    required this.getCurrentIndex,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      elevation: 4,
      color: context.theme.appColors.tertiary,
      shadowColor: Colors.indigo.shade900,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: SizedBox(
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomNavItem(
              title: randomLabel,
              icon: FontAwesomeIcons.shuffle,
              isActive: currentIndex == 0 ? true : false,
              onTap: () {
                getCurrentIndex(0);
              },
            ),
            BottomNavItem(
              title: categoriesLabel,
              icon: FontAwesomeIcons.layerGroup,
              isActive: currentIndex == 1 ? true : false,
              onTap: () {
                getCurrentIndex(1);
              },
            ),
            BottomNavItem(
              title: bookMarkLabel,
              icon: FontAwesomeIcons.solidBookmark,
              isActive: currentIndex == 2 ? true : false,
              onTap: () {
                getCurrentIndex(2);
              },
            ),
            BottomNavItem(
              title: authorsLabel,
              icon: FontAwesomeIcons.user,
              isActive: currentIndex == 3 ? true : false,
              onTap: () {
                getCurrentIndex(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
