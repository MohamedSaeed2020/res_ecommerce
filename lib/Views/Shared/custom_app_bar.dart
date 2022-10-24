import 'package:flutter/material.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {
  final String title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(2.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.w),
              bottomLeft: Radius.circular(8.w),
            ),
            color: AppColors.primaryColor,
          ),
          child: Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 2.5.h,
                color: AppColors.whiteColor,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                title,
                style:  TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 11.sp
                ),
              )
            ],
          ),
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