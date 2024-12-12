import 'package:e_commerce_app/provider/userCart_provider.dart';
import 'package:e_commerce_app/screens/CheckOutPage.dart';
import 'package:e_commerce_app/screens/OrderSummary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserCartPage extends StatefulWidget {
  const UserCartPage({super.key});

  @override
  State<UserCartPage> createState() => _UserCartPageState();
}

class _UserCartPageState extends State<UserCartPage> {
  @override
  void initState() {
    super.initState();
    final userCartProvider =
        Provider.of<UsercartProvider>(context, listen: false);
    userCartProvider.productFromUsercart();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UsercartProvider>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text("Cart"),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        body: Column(
          children: [
            const Expanded(child: CartProductListW()),
            OrderSummary(cartProvider: value),
            CheckOutButton(
              myOnPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Checkoutpage(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CartProductListW extends StatefulWidget {
  const CartProductListW({super.key});

  @override
  State<CartProductListW> createState() => _CartProductListWState();
}

class _CartProductListWState extends State<CartProductListW> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UsercartProvider>(
      builder: (context, value, child) {
        if (value.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (value.cartList.isEmpty) {
          return const Center(
            child: Text("Your cart is empty!"),
          );
        }

        return ListView.builder(
          itemCount: value.cartList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: ListTile(
                  tileColor: const Color.fromARGB(255, 240, 232, 232),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      value.cartList[index].image,
                      height: 60,
                      width: 60,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        value.cartList[index].title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0,
                        ),
                      ),
                      Text(
                        value.cartList[index].category,
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 10),
                      ),
                      Text(
                        "RS.${value.cartList[index].price}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 139, 25, 184),
                        ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete_forever_outlined,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
