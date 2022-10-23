import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:res_ecommerce/Config/assets_paths.dart';
import 'package:sizer/sizer.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AssetsManager.emptyBasket,
        width: 70.w,
        height: 70.w,
        fit: BoxFit.contain,
      ),
    );
  }
}
