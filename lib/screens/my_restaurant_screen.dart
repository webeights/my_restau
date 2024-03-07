import 'package:flutter/material.dart';
import 'package:my_restau/data/dummy_data.dart';
import 'package:my_restau/screens/nav_screen/cart.dart';
import 'package:my_restau/screens/nav_screen/favorite_screen.dart';
import 'package:my_restau/screens/nav_screen/home_screen.dart';
import 'package:my_restau/screens/nav_screen/profile_screen.dart';

class MyRestaurant extends StatefulWidget {
  const MyRestaurant({super.key});

  @override
  State<MyRestaurant> createState() => _MyRestaurantState();
}

class _MyRestaurantState extends State<MyRestaurant> {
  int currentIndex = 0;

  List<Widget> page = [
    HomeScreen(
      listItem: menu,
    ),
    Cart(
      listOfItem: menu,
    ),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFD14D72),
        backgroundColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(82, 209, 77, 114),
        iconSize: 23,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
