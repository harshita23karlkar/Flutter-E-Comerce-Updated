import 'package:e_commerce_app/provider/userCart_provider.dart';
import 'package:e_commerce_app/provider/user_provider.dart';
import 'package:e_commerce_app/screens/OrderSummary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkoutpage extends StatefulWidget {
  const Checkoutpage({super.key});

  @override
  State<Checkoutpage> createState() => _CheckoutpageState();
}

class _CheckoutpageState extends State<Checkoutpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(child: Text("CheckOut")),
        ),
        body: FutureBuilder(
          future: Provider.of<UserProvider>(context, listen: false)
              .fetchAndSetUserDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Consumer2<UserProvider, UsercartProvider>(
                  builder: (context, value, value2, child) {
                return ListView(
                  children: [
                    ListTile(
                      dense: true,
                      isThreeLine: true,
                      leading: const CircleAvatar(
                        child: Icon(
                          Icons.location_on,
                          color: const Color.fromARGB(255, 11, 101, 175),
                        ),
                        backgroundColor: Color.fromARGB(255, 211, 213, 214),
                      ),
                      title: Text(
                        "${value.userDetails!.address.city}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("${value.userDetails!.address.street}"),
                      tileColor: Color.fromARGB(0, 214, 214, 219),
                    ),
                    ListTile(
                      dense: true,
                      leading: const CircleAvatar(
                          child: Icon(
                            Icons.watch_rounded,
                            color: const Color.fromARGB(255, 11, 101, 175),
                          ),
                          backgroundColor: Color.fromARGB(255, 211, 213, 214)),
                      title: Text(
                        "${new DateTime.now()}",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: OrderSummary(cartProvider: value2),
                    ),
                    PaymentOptionW(),
                    CheckOutButton(myOnPressed: () {}),
                  ],
                );
              });
            }
          },
        ));
  }
}

class PaymentOptionW extends StatefulWidget {
  const PaymentOptionW({super.key});

  @override
  State<PaymentOptionW> createState() => _PaymentOptionWState();
}

class _PaymentOptionWState extends State<PaymentOptionW> {
  @override
  Widget build(BuildContext context) {
    int? _selectedValue;
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        children: [
          const ListTile(
            dense: true,
            leading: const Text(
              "Choose payment method",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            dense: true,
            hoverColor: Color.fromARGB(255, 52, 143, 218),
            leading: Icon(Icons.payments),
            title: const Text(
              "Paypal",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Radio<int>(
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                _selectedValue = value;
              },
            ),
          ),
          ListTile(
            dense: true,
            hoverColor: Color.fromARGB(255, 52, 143, 218),
            leading: const Icon(Icons.credit_card),
            title: const Text(
              "Credit Card",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Radio<int>(
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                _selectedValue = value;
              },
            ),
          ),
          ListTile(
            dense: true,
            hoverColor: Color.fromARGB(255, 52, 143, 218),
            leading: Icon(Icons.currency_rupee_rounded),
            title: const Text(
              "Cash",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: Radio<int>(
              value: 1,
              groupValue: _selectedValue,
              onChanged: (value) {
                _selectedValue = value;
              },
            ),
          ),
          const ListTile(
            dense: true,
            leading: const Text(
              "Add new payment method",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
