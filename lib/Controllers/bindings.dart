import 'package:get/get.dart';
import 'package:res_ecommerce/Controllers/cart_controller.dart';
import 'package:res_ecommerce/Controllers/grocery_controller.dart';
import 'package:res_ecommerce/Controllers/home_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => GroceryController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
  }
}
