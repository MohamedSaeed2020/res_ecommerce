import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:sizer/sizer.dart';

class AppHelpers {
  static void makeAppInPortraitModeOnly() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }


  static void makeStatusBarIconDark() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: AppColors.whiteColor,
    ));
  }

  static showSnackBar(String message, String status) {
    Get.snackbar(
      status == "error" ? 'Problem' : 'Alarm',
      message,
      //icon: Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor:
          status == "error" ? AppColors.lightRed : AppColors.lightGreen,
      borderRadius: 3.w,
      margin: EdgeInsets.all(2.h),
      colorText: AppColors.whiteColor,
      duration: const Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
