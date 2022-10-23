import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Controllers/grocery_controller.dart';
import 'package:res_ecommerce/Views/Screens/Grocery/Components/addresses_item.dart';
import 'package:res_ecommerce/Views/Screens/Grocery/Components/category_item.dart';
import 'package:res_ecommerce/Views/Screens/Grocery/Components/deals_of_the_day_item.dart';
import 'package:res_ecommerce/Views/Screens/Grocery/Components/offers.dart';
import 'package:res_ecommerce/Views/Shared/custom_app_bar.dart';
import 'package:res_ecommerce/Views/Shared/traditional_text_form_field.dart';
import 'package:sizer/sizer.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(
            title: 'Mustafa St.',
          ),
          SizedBox(
            height: 3.h,
          ),
          TraditionalTextFormField(
            hintText: 'Search in thousands of products',
            textInputType: TextInputType.text,
            controller: TextEditingController(),
            suffix: Icons.search_outlined,
          ),
          SizedBox(
            height: 3.h,
          ),
          GetBuilder<GroceryController>(builder: (controller) {
            return SizedBox(
              height: 8.h,
              child: controller.addressesList.isEmpty
                  ? const Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.primaryColor,
                        size: 50.0,
                      ),
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AddressesItem(
                          addressModel: controller.addressesList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 3.w,
                        );
                      },
                      itemCount: controller.addressesList.length,
                    ),
            );
          }),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 3.h),
            child: Row(
              children: [
                Text(
                  'Explore By Category',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: 11.sp,
                  ),
                ),
                const Spacer(),
                GetBuilder<GroceryController>(builder: (controller) {
                  return GestureDetector(
                    onTap: () {},
                    child: Text(
                      'See All (${controller.categoriesList.length})',
                      style: TextStyle(
                        color: AppColors.searchHintColor,
                        fontSize: 9.sp,
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          GetBuilder<GroceryController>(builder: (controller) {
            return SizedBox(
              height: 12.h,
              child: controller.categoriesList.isEmpty
                  ? const Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.primaryColor,
                        size: 50.0,
                      ),
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          categoryModel: controller.categoriesList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 4.w,
                        );
                      },
                      itemCount: controller.categoriesList.length,
                    ),
            );
          }),
          Padding(
            padding: EdgeInsets.only(bottom: 3.h, top: 2.h),
            child:  Text(
              'Deals of the day',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.blackColor,
                  fontSize: 11.sp
              ),
            ),
          ),
          GetBuilder<GroceryController>(builder: (controller) {
            return SizedBox(
              height: 14.h,
              child: controller.dealsOfTheDayList.isEmpty
                  ? const Center(
                      child: SpinKitFadingCircle(
                        color: AppColors.primaryColor,
                        size: 50.0,
                      ),
                    )
                  : ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DealsOfTheDayItem(
                          dealsOfTheDayModel:
                              controller.dealsOfTheDayList[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          width: 2.w,
                        );
                      },
                      itemCount: controller.dealsOfTheDayList.length,
                    ),
            );
          }),
          SizedBox(
            height: 3.h,
          ),
          const Offers(),
          SizedBox(
            height: 5.h,
          ),
        ],
      ),
    );
  }
}
