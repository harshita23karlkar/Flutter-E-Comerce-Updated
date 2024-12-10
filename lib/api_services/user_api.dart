import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApiService {
  // userLogin(String username, String password) async {
  //   var res = await http.post(Uri.parse("https://fakestoreapi.com/auth/login"),
  //       body: {username, password});
  //   return res.body;
  // }

  userAuth(String username, String password) async {
    const url = 'https://fakestoreapi.com/auth/login';
    var credentials = {
      'username': username,
      'password': password,
    };
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(credentials),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data); // Handle the response data
        return data;
      } else {
        print('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
