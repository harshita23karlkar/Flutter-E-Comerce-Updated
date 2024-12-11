import 'dart:ui';

import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';

// see all wala widget
Widget buildSectionHeader(String title, VoidCallback onSeeAllPressed) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          child: const Text("See All"),
        ),
      ],
    ),
  );
}

//horizontal list ke liye
Widget buildHorizontalList(List<ProductModel> products) {
  // int plength = products.length / 2 as int;
  return SizedBox(
    height: 150,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return buildProductCard(product);
      },
      separatorBuilder: (context, index) => const SizedBox(width: 10),
    ),
  );
}

//product card ke lite
Widget buildProductCard(ProductModel product) {
  return Container(
    width: 120,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 4,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            product.title,
            style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            'Rs.${product.price}',
            style: const TextStyle(color: Color.fromARGB(255, 92, 83, 218)),
          ),
        ),
      ],
    ),
  );
}
