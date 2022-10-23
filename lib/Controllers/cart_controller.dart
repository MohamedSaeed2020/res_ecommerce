import 'package:get/get.dart';
import 'package:res_ecommerce/Cores/Helpers/app_helpers.dart';
import 'package:res_ecommerce/Data/Models/deals_of_the_day_model.dart';

class CartController extends GetxController {
  List<DealsOfTheDayModel> products = [];
  double totalPrice = 0.0;
  Map<String, int> requestedTotalQuantity = {};
  List<DealsOfTheDayModel> favorites = [];

  void addToCart(DealsOfTheDayModel product) {
    if (products.isEmpty) {
      products.add(product);
    } else {
      for (var element in products) {
        if (element.id == product.id) {
          AppHelpers.showSnackBar('You Already Added It Before', 'error');
          return;
        }
      }
      products.add(product);
    }
    addTotalQuantity(product);
    calculateTotalPrice();
    AppHelpers.showSnackBar('Added To Cart Successfully', 'success');
    update();
  }

  void calculateTotalPrice() {
    totalPrice = 0.0;
    for (var product in products) {
      totalPrice +=
          getProductRequestedTotalQuantity(productId: product.id).toDouble() *
              double.parse(product.priceAfterDeal);
    }
  }

  void addTotalQuantity(DealsOfTheDayModel product) {
    if (getProductRequestedTotalQuantity(productId: product.id) == 0) {
      requestedTotalQuantity.addIf(true, product.id, 1);
      calculateTotalPrice();
    } else {
      requestedTotalQuantity[product.id] =
          requestedTotalQuantity[product.id]! + 1;
      calculateTotalPrice();
    }
    update();
  }

  void addAndRemoveFavorites(DealsOfTheDayModel product) {
    for (var element in favorites) {
      if (element.id == product.id) {
        favorites.remove(product);
        update();
        return;
      }
    }
    favorites.add(product);
    update();
  }

  bool isFavorite(DealsOfTheDayModel product) {
    bool isFavorite = false;
    for (var element in favorites) {
      if (element.id == product.id) {
        isFavorite = true;
      }
    }
    return isFavorite;
  }

  void decreaseTotalQuantity(DealsOfTheDayModel product) {
    if (getProductRequestedTotalQuantity(productId: product.id) > 0) {
      requestedTotalQuantity[product.id] =
          getProductRequestedTotalQuantity(productId: product.id) - 1;
    }
    calculateTotalPrice();
    update();
  }

  int getProductRequestedTotalQuantity({required String productId}) {
    return requestedTotalQuantity[productId] ?? 0;
  }
}
