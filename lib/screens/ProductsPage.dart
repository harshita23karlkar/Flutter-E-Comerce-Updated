import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/provider/product_provider.dart';
import 'package:e_commerce_app/screens/Product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Productspage extends StatelessWidget {
  const Productspage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Products")),
      ),
      body: Consumer<ProductProvider>(
        builder: (context, value, child) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 2,
          ),
          itemCount: value.plist.length,
          itemBuilder: (BuildContext context, int index) {
            return buildProductPageCard(value.plist[index], () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    product: value.plist[index],
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}

Widget buildProductPageCard(
    ProductModel product, VoidCallback onImageTapAction) {
  return Container(
    width: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(5.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: BorderSide.strokeAlignOutside,
          // blurRadius: 2,
          // offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              onImageTapAction();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12.0)),
                image: product.image.isEmpty
                    ? null
                    : DecorationImage(
                        image: NetworkImage(product.image),
                        fit: BoxFit.cover,
                      ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${product.title.substring(0, 18)}....",
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Rs. ${product.price}',
            style: const TextStyle(color: Color.fromARGB(255, 156, 154, 154)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  "add to cart",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  "buy now",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
