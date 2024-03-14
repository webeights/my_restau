import 'package:flutter/material.dart';
import 'package:my_restau/models/menu_item.dart';
import 'package:my_restau/screens/cart_item.dart';
import 'package:my_restau/screens/details_screen.dart';
import 'package:my_restau/screens/my_restaurant_screen.dart';
import 'package:my_restau/screens/login_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({required this.listOfItem, super.key});

  final List<MenuItem> listOfItem;

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void removeItem(MenuItem item) {
    setState(() {
      widget.listOfItem.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget cartIsEmpty = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'asset/icon/shopping.png',
            width: 180,
          ),
          const SizedBox(
            height: 10,
          ),
          const TextWidget(
            text: 'Good Food is Always Cookings',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          const SizedBox(
            height: 15,
          ),
          const TextWidget(
            text: 'Your Cart is empty. \nAdd something from menu',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomButtonWidget(
              text: 'Food Menu',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => const MyRestaurant(),
                  ),
                );
              })
        ],
      ),
    );

    if (widget.listOfItem.isNotEmpty) {
      cartIsEmpty = SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          child: ListView.builder(
            itemCount: widget.listOfItem.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(widget.listOfItem[index]),
                onDismissed: (dismiss) {
                  removeItem(widget.listOfItem[index]);
                },
                child: CartItem(
                  cartItem: widget.listOfItem[index],
                ),
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: 'My Cart',
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: cartIsEmpty,
    );
  }
}
