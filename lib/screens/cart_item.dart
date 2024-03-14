import 'package:flutter/material.dart';
import 'package:my_restau/models/menu_item.dart';
import 'package:my_restau/screens/login_screen.dart';

class CartItem extends StatefulWidget {
  const CartItem({
    required this.cartItem,
    super.key,
  });

  final MenuItem cartItem;

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int itemCount = 1;

  void addMenuItem() {
    setState(() {
      itemCount++;
    });
  }

  void reduceMenuItem() {
    if (itemCount < 2) {
      return;
    } else {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              child: Image.asset(
                widget.cartItem.images,
                height: 60,
                width: 60,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextWidget(
                  text: widget.cartItem.title,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
                TextWidget(
                  text: '\$${widget.cartItem.amount.toStringAsFixed(2)}',
                  fontSize: 12,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: <Widget>[
                IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onPressed: reduceMenuItem,
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                TextWidget(text: itemCount.toString()),
                IconButton(
                  onPressed: addMenuItem,
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
