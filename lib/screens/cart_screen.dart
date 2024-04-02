import 'package:flutter/material.dart';
import 'package:my_restau/data/dummy_data.dart';
import 'package:my_restau/models/menu_item.dart';
import 'package:my_restau/screens/cart_item.dart';
import 'package:my_restau/screens/login_screen.dart';
import 'package:my_restau/screens/nav_screen/search_screen.dart';
import 'package:my_restau/widgets/custom_button_widget.dart';

class Cart extends StatefulWidget {
  const Cart({
    required this.listOfItem,
    super.key,
  });

  final List<MenuItem> listOfItem;

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  int currentIndexItem = 0;

  // Remove Item in Cart
  void removeItem(MenuItem menuItem) {
    setState(() {
      menu.remove(menuItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Check if the item was added.
    // If empty display a text.
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
                  builder: (context) => SearchScreen(
                    listItem: widget.listOfItem,
                  ),
                ),
              );
            },
          )
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
                child: CartItem(
                  cartItem: widget.listOfItem[index],
                ),
                onDismissed: (value) {
                  removeItem(widget.listOfItem[index]);
                },
              );
            },
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const TextWidget(
          text: 'My Cart',
          fontSize: 18,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: cartIsEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
