import 'package:flutter/material.dart';
import 'package:my_restau/models/menu_item.dart';
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
  int itemCount = 0;

  void addMenuItem() {
    setState(() {
      itemCount++;
    });
  }

  void removeMenuItem() {
    if (itemCount < 1) {
      return;
    } else {
      setState(() {
        itemCount--;
      });
    }
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
            onPressed: () {},
            icon: Image.asset(
              'asset/icon/shopping-cart-add.png',
              width: 20,
              color: const Color(0xFFD14D72),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Image.asset(
                widget.item.images,
                width: 250,
                height: 250,
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
              children: [
                TextWidget(
                  text: '\$${widget.item.amount.toStringAsFixed(2)}',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
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
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD14D72),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        print('Add to cart');
                      },
                      child: const TextWidget(
                        text: 'Add to Cart',
                        textColor: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      IconButton(
                        onPressed: removeMenuItem,
                        icon: const Icon(Icons.remove_circle_outline_outlined),
                      ),
                      TextWidget(
                        text: itemCount.toString(),
                        fontSize: 18,
                      ),
                      IconButton(
                        onPressed: addMenuItem,
                        icon: const Icon(Icons.add_circle_outline_outlined),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
