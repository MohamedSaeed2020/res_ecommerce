import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Controllers/grocery_controller.dart';
import 'package:sizer/sizer.dart';

class Offers extends StatelessWidget {
  const Offers({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GroceryController>(builder: (controller) {
      return Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: AppColors.offersCardColor,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: controller.offersModel == null
            ? const Center(
          child: SpinKitFadingCircle(
            color: AppColors.primaryColor,
            size: 50.0,
          ),
        )
            : Row(
          children: [
            const Flexible(
              fit: FlexFit.tight,
              child: SizedBox(
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    controller.offersModel!.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.redColor,
                      fontSize: 11.sp,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 0.1.h,
                  ),
                  Text(
                    controller.offersModel!.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.offersDescriptionColor,
                      fontSize: 31.sp,
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$ ${controller.offersModel!.priceAfterDeal}",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "\$ ${controller.offersModel!.priceBeforeDeal}",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    "* Available until ${controller.offersModel!.availableUntil}",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 9.sp,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });

  }
}
