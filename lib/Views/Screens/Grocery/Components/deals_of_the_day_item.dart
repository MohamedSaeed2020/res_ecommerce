import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Controllers/cart_controller.dart';
import 'package:res_ecommerce/Data/Models/deals_of_the_day_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class DealsOfTheDayItem extends StatelessWidget {
  final DealsOfTheDayModel dealsOfTheDayModel;

  const DealsOfTheDayItem({Key? key, required this.dealsOfTheDayModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find<CartController>();
    return GestureDetector(
      onTap: () {
        controller.addToCart(dealsOfTheDayModel);
      },
      child: Container(
        width: 80.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.w),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                CachedNetworkImage(
                  width: 25.w,
                  height: 25.w,
                  fit: BoxFit.cover,
                  imageUrl: dealsOfTheDayModel.image,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: AppColors.shimmerBaseColor,
                    highlightColor: AppColors.shimmerHighlightColor,
                    child: Container(
                      height: 25.w,
                      width: 25.w,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(3.w),
                      ),
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Positioned(
                  top: -2.w,
                  left: -2.w,
                  child: GestureDetector(
                    onTap: () {
                      controller.addAndRemoveFavorites(dealsOfTheDayModel);
                    },
                    child: Container(
                      width: 10.w,
                      height: 10.w,
                      decoration: const BoxDecoration(
                        color: AppColors.whiteColor,
                        shape: BoxShape.circle,
                      ),
                      child: GetBuilder<CartController>(builder:(controller){
                        return Icon(
                          Icons.favorite_border_outlined,
                          size: 5.w,
                          color: controller.isFavorite(dealsOfTheDayModel)
                              ? AppColors.redColor
                              : AppColors.greyColor,
                        );
                      } ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 3.w,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dealsOfTheDayModel.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  dealsOfTheDayModel.description,
                  style: TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 10.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      size: 2.h,
                      color: AppColors.greyColor,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      child: Text(
                        dealsOfTheDayModel.location,
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 10.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Expanded(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "\$ ${dealsOfTheDayModel.priceAfterDeal}",
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Text(
                        "\$ ${dealsOfTheDayModel.priceBeforeDeal}",
                        style: TextStyle(
                          color: AppColors.greyColor,
                          decoration: TextDecoration.lineThrough,
                          fontWeight: FontWeight.bold,
                          fontSize: 13.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
