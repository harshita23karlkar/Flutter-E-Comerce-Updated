import 'package:e_commerce_app/api_services/user_cart_api.dart';
import 'package:e_commerce_app/models/cart_model.dart';
import 'package:e_commerce_app/screens/HomePage.dart';
import 'package:e_commerce_app/screens/UserCartPage.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _correntIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        setState(() {
          _correntIndex = index;
        });
        if (index == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Homepage(),
              ));
        } else if (index == 1) {
          print("Search selected");
        } else if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserCartPage(),
            ),
          );
        } else if (index == 3) {
          print("Profile selected");
        }
      },
      currentIndex: _correntIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
      ],
    );
  }
}

// AppBar

class AppBarW extends StatelessWidget {
  String userName;
  AppBarW({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "https://rukminim2.flixcart.com/fk-p-flap/1010/170/image/262c8a79cd8b80dc.jpg?q=20"), //  user image
        ),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Hello!",
              style: TextStyle(fontSize: 16, color: Colors.grey)),
          Text(userName,
              style:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.black),
          onPressed: () {},
        ),
      ],
    );
  }
}
