import 'package:e_commerce_app/models/user_model.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/screens/ProductsPage.dart';
import 'package:e_commerce_app/screens/widgets/carouser.dart';
import 'package:e_commerce_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './widgets/HomePageWidgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // var userRef = UserModel();
  @override
  void initState() {
    context.read<ProductProvider>().fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Consumer2<UserModel, ProductProvider>(
        builder: (context, value, value2, child) => Column(
          children: [
            AppBarW(
              userName: value.getUserName(),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // crossAxisAlignment: CrossAxisAlignment.start,

                    // Searching field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "search here....",
                            prefixIcon: const Icon(Icons.search),
                            filled: true,
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Carouser images
                    MyCarouserSlider(),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // Feature Section
                    buildSectionHeader("Featured", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productspage(),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    buildHorizontalList(value2.plist.take(5).toList()),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // Most Popular Section
                    buildSectionHeader("Most Popular", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Productspage(),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 10.0,
                    ),
                    buildHorizontalList(value2.plist.take(5).toList()),
                    const SizedBox(
                      height: 20.0,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
