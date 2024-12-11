import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserCartApiService {
  Future<List<Product>> fetchUserCart() async {
    List<Product> productsList = [];
    try {
      var userId = await UserModel().getUserId();
      var res =
          await http.get(Uri.parse("https://fakestoreapi.com/carts/$userId"));

      if (res.statusCode == 200) {
        CartModel userCart = cartModelFromJson(res.body);
        productsList = userCart.products;
        return productsList;
      } else {
        print("failed to fetch the cart: ${res.statusCode}");
      }
    } catch (e) {
      print("error fetching user cart: $e");
      return productsList;
    }
    return productsList;
  }
}
