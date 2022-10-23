import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Controllers/home_controller.dart';
import 'package:sizer/sizer.dart';

class BottomNavBarItem extends StatelessWidget {
  final int index;
  final String title;
  final String imagePath;

  const BottomNavBarItem({
    Key? key,
    required this.index,
    required this.title,
    required this.imagePath
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return GestureDetector(
        onTap: () => controller.jumpToTab(index),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              imagePath,
              color: controller.isActive(index)
                  ? AppColors.bottomNavBarActiveColor
                  : AppColors.bottomNavBarDeActiveColor,
              width: 3.h,
              height: 3.h,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              title,
              style: TextStyle(
                color: controller.isActive(index)
                    ? AppColors.bottomNavBarActiveColor
                    : AppColors.bottomNavBarDeActiveColor,
                fontSize: 10.sp,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    });
  }
}
