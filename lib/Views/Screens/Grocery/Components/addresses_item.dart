import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Data/Models/address_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class AddressesItem extends StatelessWidget {
  final AddressModel addressModel;

  const AddressesItem({Key? key, required this.addressModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      padding: EdgeInsets.all(1.5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        border: Border.all(
          color: AppColors.addressesBorderColor,
          width: 0.1.w,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: 11.w,
            height: 11.w,
            fit: BoxFit.cover,
            imageUrl:
            addressModel.image,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: AppColors.shimmerBaseColor,
              highlightColor: AppColors.shimmerHighlightColor,
              child: Container(
                height: 11.w,
                width: 11.w,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(3.w),
                ),
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          SizedBox(
            width: 2.w,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                addressModel.name,
                style:  TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor,
                  fontSize: 10.sp,
                ),
              ),
              SizedBox(
                height: 0.2.h,
              ),
              Expanded(
                child: Text(
                  addressModel.address,
                  style:  TextStyle(
                    color: AppColors.blackColor,
                    fontSize: 8.sp,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
