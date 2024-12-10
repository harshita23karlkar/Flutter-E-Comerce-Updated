import 'dart:convert';

import 'package:e_commerce_app/api_services/user_api.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel extends ChangeNotifier {
  String? username;
  String? password;
  void setUserName(String username) {
    this.username = username;
  }

  String getUserName() {
    return this.username ?? "username";
  }

  bool isuserLogIn = false;
  userLogin(String username, password) async {
    try {
      var token = await UserApiService().userAuth(username, password);
      // this.username = username;
      // this.password = password;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print("wieruyoweiue9i7uwo9r78w ye mere wala $token");
      await prefs.setString("token", jsonEncode(token));
      print(isUserLoggedIn);
      return true;
    } catch (e) {
      return "login failed $e";
    }
  }

  Future<bool> isUserLoggedIn() async {
    bool isUserIn = false;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    if (token!.isNotEmpty) {
      isUserIn = true;
      isuserLogIn = true;
    } else {
      isUserIn = false;
      isuserLogIn = false;
    }
    return isUserIn;
  }
}
