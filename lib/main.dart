import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/provider/userCart_provider.dart';
import 'package:e_commerce_app/provider/user_provider.dart';
import 'package:e_commerce_app/screens/HomePage.dart';
import 'package:e_commerce_app/screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ProductProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserModel(),
          ),
          ChangeNotifierProvider(
            create: (context) => UsercartProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => UserProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: UserModel().isuserLogIn ? const Homepage() : Login(),
        ));
  }
}
