import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:res_ecommerce/Config/app.dart';
import 'package:res_ecommerce/Cores/Helpers/app_helpers.dart';

class AppConfigs {
  static Future<void> config() async {
    WidgetsFlutterBinding.ensureInitialized();
    AppHelpers.makeAppInPortraitModeOnly();
    AppHelpers.makeStatusBarIconDark();
    //runApp(const MyApp());
       runApp(
      DevicePreview(
        enabled: !kReleaseMode,
        builder: (context) => const MyApp(), // Wrap your app
      ),
    );
  }
}
