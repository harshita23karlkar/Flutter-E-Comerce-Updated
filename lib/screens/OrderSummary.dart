import 'package:e_commerce_app/provider/userCart_provider.dart';
import 'package:flutter/material.dart';

class OrderSummary extends StatelessWidget {
  final UsercartProvider cartProvider;

  const OrderSummary({required this.cartProvider, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemsCount = cartProvider.cartList.length;
    final subtotal = cartProvider.ammount;
    const double discount = 0.0;
    const double deliveryCharges = 100;
    final total = subtotal - discount + deliveryCharges;

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 250, 248, 248),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            // color: Color.fromARGB(255, 155, 154, 154),
            blurRadius: 5,
            offset: Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order Summary",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Items"),
              Text("$itemsCount"),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Subtotal"),
              Text("$subtotal"),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Discount"),
              Text("$discount"),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Delivery Charges"),
              Text("$deliveryCharges"),
            ],
          ),
          const Divider(thickness: 1.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
              Text(
                "Rs.$total",
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Handle checkout logic here
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              minimumSize: const Size(double.infinity, 50),
              backgroundColor: const Color.fromARGB(255, 76, 46, 211),
            ),
            child: const Text(
              "Check Out",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
