import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:res_ecommerce/Config/colors.dart';
import 'package:res_ecommerce/Controllers/home_controller.dart';
import 'package:res_ecommerce/Cores/Utils/home_nav_pages_data_utility.dart';
import 'package:res_ecommerce/Views/Shared/BottomNavBar/bottom_nav_bar_view.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  static final _pages = HomeNavPagesDataUtility.getNavPages();

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: GetBuilder<HomeController>(builder: (controller) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 2.h),
            child: _pages[controller.index],
          );
        }),
        extendBodyBehindAppBar: true, // Needed to show content under appbar
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
