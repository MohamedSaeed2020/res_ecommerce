import 'package:flutter/material.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Config/size.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class TraditionalTextFormField extends StatelessWidget {
  TraditionalTextFormField({
    Key? key,
    required this.hintText,
    required this.textInputType,
    this.icon,
    required this.controller,
    this.validate,
    this.maxLength,
    this.suffix,
    this.isPassword = false,
    this.suffixPressed,
    this.enabled = true,
  }) : super(key: key);

  final String hintText;
  final int? maxLength;
  final TextInputType textInputType;
  final Widget? icon;
  final TextEditingController controller;
  final String? Function(String?)? validate;
  IconData? suffix;
  bool isPassword = false;
  Function()? suffixPressed;
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 12.sp,
      ),
      autofocus: false,
      enabled: enabled,
      maxLength: maxLength,
      validator: validate,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: textInputType,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: suffix != null
            ? IconButton(
                icon: Center(
                  child: Icon(
                    suffix,
                    size: SizeConfig.widthMultiplier*5,
                    color: AppColors.searchIconColor,
                  ),
                ),
                onPressed: suffixPressed,
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical:SizeConfig.heightMultiplier*2.5 ),
        isDense: true,
        filled: true,
        fillColor: AppColors.searchBoxColor,
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.searchHintColor.withOpacity(0.70),
          fontSize: 11.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3.w),
          ),
          borderSide: BorderSide(color: AppColors.searchBoxBorderColor, width: 0.2.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3.w),
          ),
          borderSide: BorderSide(color: AppColors.searchBoxBorderColor, width: 0.2.w),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(3.w),
          ),
          borderSide: BorderSide(color: AppColors.searchBoxBorderColor, width: 0.2.w),
        ),
        icon: icon,
      ),
    );
  }
}
