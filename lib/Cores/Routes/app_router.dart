import 'package:get/get.dart';
import 'package:res_ecommerce/Views/Screens/Cart/cart_screen.dart';
import 'package:res_ecommerce/Views/Screens/Favorites/favorites_screen.dart';
import 'package:res_ecommerce/Views/Screens/Grocery/grocery_screen.dart';
import 'package:res_ecommerce/Views/Screens/Home/home_screen.dart';
import 'package:res_ecommerce/Views/Screens/News/news_screen.dart';


class AppRoutes {
  static String homeLayout = "/homeLayout";
  static String categoriesScreen = "/categoriesScreen";
  static String newsScreen = "/newsScreen";
  static String favoritesScreen = "/favoritesScreen";
  static String cartScreen = "/cartScreen";

  static List<GetPage> routes = [
    GetPage(name: homeLayout, page: () => const HomeScreen()),
    GetPage(name: categoriesScreen, page: () =>  const GroceryScreen()),
    GetPage(name: newsScreen, page: () => const NewsScreen()),
    GetPage(name: favoritesScreen, page: () => const FavoritesScreen()),
    GetPage(name: cartScreen, page: () => const CartScreen()),
  ];
}
