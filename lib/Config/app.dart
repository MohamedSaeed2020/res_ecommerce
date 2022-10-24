import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:res_ecommerce/Config/size.dart';
import 'package:res_ecommerce/Controllers/bindings.dart';
import 'package:res_ecommerce/Cores/Routes/app_router.dart';
import 'package:res_ecommerce/Cores/Utils/constants.dart';
import 'package:sizer/sizer.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return LayoutBuilder(builder: (context, constraints) {
        SizeConfig().init(constraints);
        return GetMaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          initialBinding: Binding(),
/*          builder: (BuildContext context, Widget? child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaleFactor: 1.0,
              ),
              child: child!,
            );
          },*/
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            fontFamily: fontFamily,
          ),
          initialRoute: AppRoutes.homeLayout,
          getPages: AppRoutes.routes,
        );
      });
    });
  }
}
