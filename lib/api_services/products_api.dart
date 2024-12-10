import 'package:e_commerce_app/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsApiService {
  Future<List<ProductModel>> fetchProduct() async {
    List<ProductModel> list = [];
    String url = "https://fakestoreapi.com/products";
    var res = await http.get(Uri.parse(url));
    list = productModelFromJson(res.body);
    return list;
  }
}
