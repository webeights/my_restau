import 'package:flutter/material.dart';
import 'package:my_restau/models/menu_item.dart';
import 'package:my_restau/screens/cart_screen.dart';
import 'package:my_restau/screens/login_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({
    required this.item,
    super.key,
  });

  final MenuItem item;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final List<MenuItem> _menuItem = [];

  void saveMenuItem(MenuItem items) {
    setState(() {
      _menuItem.add(items);
    });
  }

  void addItemIntoCart() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          content: const TextWidget(
            text: 'Successfully added Item',
            textAlign: TextAlign.center,
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.done),
            ),
          ],
        );
      },
    );

    saveMenuItem(
      MenuItem(
        title: widget.item.title,
        images: widget.item.images,
        amount: widget.item.amount,
        ratings: widget.item.ratings,
        cookingTime: widget.item.cookingTime,
        description: widget.item.description,
      ),
    );
  }

  int itemCount = 1;

  void addMenuItem() {
    setState(() {
      itemCount++;
    });
  }

  void removeMenuItem() {
    if (itemCount < 2) {
      return;
    } else {
      setState(() {
        itemCount--;
      });
    }
  }

  void addToCartItem() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CartScreen(
          listOfItem: _menuItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          color: const Color(0xFFD14D72),
          iconSize: 20,
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: addToCartItem,
            icon: Image.asset(
              'asset/icon/shopping-cart-add.png',
              width: 20,
              color: const Color(0xFFD14D72),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  widget.item.images,
                  width: 230,
                  height: 230,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextWidget(
                text: widget.item.title,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              RatingBar.builder(
                initialRating: widget.item.ratings,
                itemCount: 5,
                minRating: 1,
                allowHalfRating: true,
                itemSize: 18,
                glow: false,
                tapOnlyMode: true,
                direction: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Icon(
                    Icons.star,
                    color: Color(0xFFD14D72),
                  );
                },
                onRatingUpdate: (ratings) => print(ratings),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: '\$${widget.item.amount.toStringAsFixed(2)}',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        iconSize: 20,
                        onPressed: removeMenuItem,
                        highlightColor: Colors.transparent,
                        icon: const Icon(
                          Icons.remove_circle_outline_outlined,
                        ),
                      ),
                      Text(itemCount.toString()),
                      IconButton(
                        iconSize: 20,
                        highlightColor: Colors.transparent,
                        onPressed: addMenuItem,
                        icon: const Icon(
                          Icons.add_circle_outline_outlined,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: widget.item.description,
                fontSize: 13,
              ),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CustomButtonWidget(
                      text: 'Order Now',
                      onTap: () {},
                    ),
                    CustomButtonWidget(
                      text: 'Add to Cart',
                      onTap: addItemIntoCart,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    required this.text,
    required this.onTap,
    super.key,
  });

  final void Function() onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFD14D72),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
