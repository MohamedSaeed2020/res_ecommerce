import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Controllers/cart_controller.dart';
import 'package:res_ecommerce/Data/Models/deals_of_the_day_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CartItem extends StatelessWidget {
  final DealsOfTheDayModel product;

  const CartItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController controller = Get.find<CartController>();

    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.addressesBorderColor,
              width: 0.1.w,
            ),
            borderRadius: BorderRadius.circular(3.w),
          ),
          child: CachedNetworkImage(
            width: 15.w,
            height: 15.w,
            fit: BoxFit.cover,
            imageUrl: product.image,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColors.shimmerBaseColor,
              highlightColor: AppColors.shimmerHighlightColor,
              child: Container(
                height: 15.w,
                width: 15.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3.w),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(
                color: AppColors.blackColor,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              product.description,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 9.sp,
              ),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "\$ ${product.priceAfterDeal}",
              style: TextStyle(
                color: AppColors.priceLightRedColor,
                fontSize: 18.sp,
              ),
            ),
          ],
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                controller.decreaseTotalQuantity(product);
              },
              child: Container(
                alignment: Alignment.center,
                width: 9.w,
                height: 9.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  color: AppColors.skyLightColor,
                ),
                child: Icon(
                  Icons.remove,
                  color: AppColors.skyDarkColor,
                  size: 7.w,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.w),
              child: GetBuilder<CartController>(builder: (controller) {
                return Text(
                  controller
                      .getProductRequestedTotalQuantity(productId: product.id)
                      .toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 19.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                );
              }),
            ),
            GestureDetector(
              onTap: () {
                controller.addTotalQuantity(product);
              },
              child: Container(
                alignment: Alignment.center,
                width: 9.w,
                height: 9.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  color: AppColors.skyLightColor,
                ),
                child: Icon(
                  Icons.add,
                  color: AppColors.skyDarkColor,
                  size: 7.w,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
