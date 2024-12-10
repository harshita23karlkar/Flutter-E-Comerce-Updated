import 'package:e_commerce_app/models/product_model.dart';
import 'package:e_commerce_app/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel product;
  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    var data = widget.product;
    return Scaffold(
      body: Column(
        children: [
          // image wala section
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                // Product image
                Positioned.fill(
                  child: Image.network(
                    data.image,
                    fit: BoxFit.cover,
                  ),
                ),
                // back button or icon
                Positioned(
                  top: 40,
                  left: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  right: 20,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite_border, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //  Details wala part
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.vertical(
                    //   top: Radius.circular(20),
                    // ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(
                            child: Text(
                              data.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "\$${data.price}",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // ratings
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 18,
                          ),
                          Text(
                            "${data.rating.rate}",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            " (30 reviews)",
                            style: TextStyle(
                                color: Color.fromARGB(255, 133, 129, 129)),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // description
                      Text(
                        data.description,
                        style: const TextStyle(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 87, 85, 85)),
                      ),
                      const SizedBox(height: 15),
                      // size options
                      const Text(
                        "Size",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: List.generate(
                          data.size.length,
                          (index) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                decoration:
                                    BoxDecoration(color: Colors.grey[200]),
                                child: Text(data.size[index]),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      // buy now button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 111, 80, 196),
                              ),
                              child: const Text(
                                "Buy Now",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.shopping_bag_outlined),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          BottomNavBar(),
        ],
      ),
    );
  }
}
