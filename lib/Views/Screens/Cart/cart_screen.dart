import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:res_ecommerce/Config/assets_paths.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Controllers/cart_controller.dart';
import 'package:res_ecommerce/Views/Screens/Cart/Components/cart_item.dart';
import 'package:res_ecommerce/Views/Shared/custom_app_bar.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            title: 'Oxford Street',
          ),
          SizedBox(
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.h, top: 2.h),
            child: Text(
              'Cart',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  fontSize: 15.sp),
            ),
          ),
          GetBuilder<CartController>(builder: (controller) {
            return controller.products.isEmpty
                ? Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 15.h),
                      child: Lottie.asset(
                       AssetsManager.emptyBasket,
                        width: 70.w,
                        height: 70.w,
                        fit: BoxFit.contain,
                      ),
                    ),
                  )
                : ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CartItem(
                        product: controller.products[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 4.h,
                      );
                    },
                    itemCount: controller.products.length,
                  );
          }),
        ],
      ),
    );
  }
}
