import 'package:book_app/app/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class VendorNavBarItem extends BottomNavigationBarItem {
  VendorNavBarItem({
    required String label,
    required String iconPath,
    required int index,
    required int selectedIndex,
  }) : super(
    label: label,
    icon: SvgPicture.asset(
      height: 40,
      iconPath,
      semanticsLabel: label,
      colorFilter: ColorFilter.mode(
        selectedIndex == index ? AppColors.themeColor : Colors.grey.shade800,
        BlendMode.srcIn,
      ),
    ),
  );
}
