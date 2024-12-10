import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/screens/HomePage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController =
      TextEditingController(text: kDebugMode ? "mor_2314" : "");

  final TextEditingController passwordController =
      TextEditingController(text: kDebugMode ? "83r5^_" : "");
  List<int> _list = [1, 2, 3, 4, 5];
  CarouselSliderController carouselController = CarouselSliderController();
  int currentIndexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider(
                  carouselController: carouselController,
                  options: CarouselOptions(
                      initialPage: currentIndexPage,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndexPage = index;
                        });
                      },
                      height: 200.0,
                      autoPlay: false,
                      viewportFraction: 0.9,
                      autoPlayInterval: Duration(seconds: 2)),
                  items: _list.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 215, 155, 226)),
                            child: Center(
                              child: Text(
                                'text $i',
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
                DotsIndicator(
                  dotsCount: _list.length,
                  position: currentIndexPage,
                  onTap: (position) async {
                    setState(() {
                      currentIndexPage = position;
                    });
                    await carouselController.animateToPage(position);
                  },
                ),
                /*ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 200),
                  child: CarouselView(
                    onTap: (value) {
                      print(value);
                      // controller.jumpTo(value * 330.0);
                      // controller.
                    },
                    controller: controller,
                    scrollDirection: Axis.horizontal,
                    itemExtent: 330,
                    shrinkExtent: 200,
                    children: List<Widget>.generate(4, (int index) {
                      return Container(
                        color: Color.fromRGBO(Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255), 1),
                        child: Text(
                          "$index",
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }),
                  ),
                ),
              */
                // Title
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),

                // Username TextField
                CustomTextField(
                  label: "Username",
                  icon: Icons.person,
                  hintText: "Type your username",
                  controller: usernameController,
                ),
                SizedBox(height: 15),

                // Password TextField
                CustomTextField(
                  label: "Password",
                  icon: Icons.lock,
                  hintText: "Type your password",
                  isPassword: true,
                  controller: passwordController,
                ),
                SizedBox(height: 10),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Forgot password functionality
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                // Login Button
                Consumer<UserModel>(
                  builder: (context, value, child) => GradientButton(
                    text: "LOGIN",
                    onPressed: () async {
                      // Access the input values
                      String username = usernameController.text;
                      String password = passwordController.text;
                      value.userLogin(username, password);
                      value.setUserName(username);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Homepage(),
                      ));

                      print(username);
                      print(password);
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Social Login
                const Text(
                  "Or Sign Up Using",
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 10),
                SocialButtons(),

                SizedBox(height: 20),

                // Sign Up
                TextButton(
                  onPressed: () {
                    // Navigate to sign-up screen
                  },
                  child: const Text(
                    "SIGN UP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextField({
    required this.label,
    required this.icon,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const GradientButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.blue, Colors.purple],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class SocialButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialButton(icon: Icons.facebook, color: Colors.blue),
        SizedBox(width: 20),
        // SocialButton(icon: Icons.twitter, color: Colors.lightBlue),
        SizedBox(width: 20),
        // SocialButton(icon: Icons.google, color: Colors.red),
      ],
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;

  const SocialButton({required this.icon, required this.color});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: color,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
