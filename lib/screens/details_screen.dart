import 'package:flutter/material.dart';
import 'package:my_restau/models/menu_item.dart';
import 'package:my_restau/screens/cart_screen.dart';
import 'package:my_restau/screens/login_screen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:my_restau/widgets/food_details.dart';

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

  bool isReadMore = false;
  var textInformation =
      'accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod';
  final textLength = 350;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 300,
              color: const Color.fromARGB(255, 244, 244, 244),
              child: Center(
                child: Image.asset(
                  widget.item.images,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          TextWidget(
                            text: widget.item.title,
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                          RatingBar.builder(
                            initialRating: widget.item.ratings,
                            itemCount: 5,
                            minRating: 1,
                            allowHalfRating: true,
                            itemSize: 15,
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
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black12,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            IconButton(
                              iconSize: 15,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: removeMenuItem,
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              itemCount.toString(),
                            ),
                            IconButton(
                              iconSize: 15,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                              onPressed: addMenuItem,
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const FoodDetails(),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 200,
                    child: Text.rich(
                      style: const TextStyle(fontSize: 13),
                      TextSpan(
                        children: [
                          TextSpan(
                            text: textInformation.length > textLength &&
                                    !isReadMore
                                ? '${textInformation.substring(0, textLength)}...'
                                : textInformation,
                          ),
                          textInformation.length > textLength
                              ? WidgetSpan(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isReadMore = !isReadMore;
                                      });
                                    },
                                    child: Text(
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFFD14D72),
                                      ),
                                      isReadMore ? ' Read Less' : 'Read More',
                                    ),
                                  ),
                                )
                              : const TextSpan(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '\$${widget.item.amount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Color(0xFFD14D72),
                          fontSize: 19,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFD14D72),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 8,
                              horizontal: 30,
                            ),
                            child: Text(
                              'Check Out',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
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
