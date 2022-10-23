import 'package:res_ecommerce/Views/Screens/Cart/cart_screen.dart';
import 'package:res_ecommerce/Views/Screens/Favorites/favorites_screen.dart';
import 'package:res_ecommerce/Views/Screens/Grocery/grocery_screen.dart';
import 'package:res_ecommerce/Views/Screens/News/news_screen.dart';

class HomeNavPagesDataUtility {
  static List getNavPages() {
    final pages = [
       const GroceryScreen(),
      const NewsScreen(),
      const FavoritesScreen(),
      const CartScreen()
    ];
    return pages;
  }
}
