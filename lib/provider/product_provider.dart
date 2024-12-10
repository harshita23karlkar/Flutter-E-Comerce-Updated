import 'package:e_commerce_app/api_services/products_api.dart';
import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> plist = [];

  void fetchData() async {
    plist = await ProductsApiService().fetchProduct();
    notifyListeners();
  }
}
