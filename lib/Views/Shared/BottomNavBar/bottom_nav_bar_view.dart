import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/assets_paths.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Controllers/cart_controller.dart';
import 'package:res_ecommerce/Views/Shared/BottomNavBar/bottom_nav_bar_item.dart';
import 'package:sizer/sizer.dart';

class MyBottomNavigationBar extends StatelessWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: 6.w),
          decoration: const BoxDecoration(
            color: AppColors.bottomNavBarColor,
          ),
          child: Padding(
            padding: EdgeInsets.only(
              right: 5.w,
              left: 5.w,
              top: 1.h,
              bottom: 1.h,
            ),
            child: Row(
              children:  <Widget>[
                const BottomNavBarItem(
                  imagePath: AssetsManager.groceryIcon,
                  index: 0,
                  title: 'Grocery',
                ),
                SizedBox(width: 12.w,),
                const  BottomNavBarItem(
                  imagePath: AssetsManager.newsIcon,
                  index: 1,
                  title: 'News',
                ),
                const Spacer(),
                const BottomNavBarItem(
                  imagePath: AssetsManager.favoritesIcon,
                  index: 2,
                  title: 'Favorites',
                ),
                SizedBox(width: 12.w,),
                const  BottomNavBarItem(
                  imagePath: AssetsManager.cartIcon,
                  index: 3,
                  title: 'Cart',
                ),
              ],
            ),
          ),
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              alignment: Alignment.center,
              width: 18.w,
              height: 18.w,
              decoration: const BoxDecoration(
                color: AppColors.bottomNavBarActiveColor,
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              bottom: 1.h,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Image.asset(AssetsManager.totalPriceIcon,width: 11.w,height: 11.w,),
                  Positioned(
                    right: 3.w,
                    top: 0.5.h,
                    child: SizedBox(
                      width: 8.w,
                      child:  FittedBox(
                        child: GetBuilder<CartController>(builder: (controller){
                          return  Text(
                            '\$ ${controller.totalPrice.toString()}',
                            style: const TextStyle(
                              color: AppColors.whiteColor,
                            ),

                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
