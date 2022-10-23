import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Data/Models/category_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;

  const CategoryItem({Key? key, required this.categoryModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
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
            imageUrl: categoryModel.image,
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
          height: 1.h,
        ),
        Text(
          categoryModel.name,
          style: TextStyle(
            color: AppColors.blackColor,
            fontSize: 10.sp,
          ),
        ),
      ],
    );
  }
}
