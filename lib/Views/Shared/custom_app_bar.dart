import 'package:flutter/material.dart';
import 'package:res_ecommerce/Config/assets_paths.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image.asset(AssetsManager.addressPng),
            Container(
              padding: EdgeInsets.all(2.w),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 2.5.h,
                    color: AppColors.whiteColor,
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  Text(
                    title,
                    style:  TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.appBarCircleBorderColor,
              width: 0.5.w,
            ),
          ),
        ),
      ],
    );
  }
}