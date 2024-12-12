import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/models/userdetails_model.dart';
import 'package:flutter/material.dart';
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
        print(data);
        return data;
      } else {
        print('Failed to login: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<UserDetailsModel?> fetchUserDetails() async {
    try {
      var userId = await UserModel().getUserId();
      var res =
          await http.get(Uri.parse("https://fakestoreapi.com/users/$userId"));

      if (res.statusCode == 200) {
        return userDetailsModelFromJson(res.body);
      } else {
        debugPrint("Failed to load user details: ${res.statusCode}");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
    return null;
  }
}
