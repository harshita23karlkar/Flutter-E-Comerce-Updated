import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/models/productwithid_model.dart';
import 'package:http/http.dart' as http;

class ProductsApiService {
  Future<List<ProductModel>> fetchProduct() async {
    List<ProductModel> list = [];
    String url = "https://fakestoreapi.com/products";
    var res = await http.get(Uri.parse(url));
    list = productModelFromJson(res.body);
    return list;
  }

  // Product with id
  Future<ProductWithIdModel> fetchProductWithId(int id) async {
    var res =
        await http.get(Uri.parse("https://fakestoreapi.com/products/$id"));
    ProductWithIdModel data = productWithIdModelFromJson(res.body);
    return data;
  }
}
