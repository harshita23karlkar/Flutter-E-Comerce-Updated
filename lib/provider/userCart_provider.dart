import 'package:e_commerce_app/api_services/products_api.dart';
import 'package:e_commerce_app/api_services/user_cart_api.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/productwithid_model.dart';
import 'package:flutter/material.dart';

// class UsercartProvider extends ChangeNotifier {
//   List<Product> productsList = [];
//   List<ProductWithIdModel> cartList = [];
//   void productFromUsercart() async {
//     productsList = await UserCartApiService().fetchUserCart();
//     notifyListeners();
//   }

//   void fetchProductsFromCart() async {
//     for (Product p in productsList) {
//       var data = await ProductsApiService().fetchProductWithId(p.productId);
//       cartList.add(data);
//       notifyListeners();
//     }
//   }

//   List<ProductWithIdModel> getCartProduct() {
//     return cartList;
//   }
// }

class UsercartProvider extends ChangeNotifier {
  List<Product> productsList = [];
  List<ProductWithIdModel> cartList = [];
  double ammount = 0;
  void setAmmount(double ammount) {
    this.ammount = ammount;
    notifyListeners();
  }

  double getAmmount() {
    return this.ammount;
  }

  bool isLoading = false;

  Future<void> productFromUsercart() async {
    isLoading = true;
    productsList = await UserCartApiService().fetchUserCart();
    isLoading = false;
    notifyListeners();
    await fetchProductsFromCart();
    calculateTotalAmmount();
  }

  void calculateTotalAmmount() {
    for (var p in cartList) {
      ammount = ammount + p.price;
    }
  }

  Future<void> fetchProductsFromCart() async {
    isLoading = true;
    notifyListeners();

    for (Product p in productsList) {
      var data = await ProductsApiService().fetchProductWithId(p.productId);
      cartList.add(data);
    }

    isLoading = false;
    notifyListeners();
  }

  List<ProductWithIdModel> getCartProduct() {
    return cartList;
  }
}
