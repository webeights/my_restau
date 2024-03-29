import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restau/data/dummy_data.dart';
import 'package:my_restau/models/menu_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({
    super.key,
  });

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  void removeFavoriteItem(MenuItem item) {
    setState(() {
      topReatedMenu.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget menuIsEmpty = Center(
      child: Text(
        'Your Favorite is Empty try to add Some',
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );

    if (topReatedMenu.isNotEmpty) {
      menuIsEmpty = Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: topReatedMenu.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: ValueKey(topReatedMenu[index]),
                    child: FavoriteItemCard(
                      cartItem: topReatedMenu[index],
                    ),
                    onDismissed: (dismiss) {
                      removeFavoriteItem(topReatedMenu[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Favorite'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: menuIsEmpty),
        ],
      ),
    );
  }
}

class FavoriteItemCard extends StatelessWidget {
  const FavoriteItemCard({
    super.key,
    required this.cartItem,
  });

  final MenuItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(
          cartItem.images,
          width: 70,
          height: 70,
        ),
        title: Row(
          children: [
            Text(
              cartItem.title,
            ),
            const Spacer(),
            const Icon(
              Icons.star,
              size: 15,
              color: Color(0xFFD14D72),
            ),
            Text(
              cartItem.ratings.toString(),
              style: GoogleFonts.poppins(
                fontSize: 12,
              ),
            ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cartItem.description,
              style: GoogleFonts.poppins(
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$${cartItem.amount.toStringAsFixed(2)}',
                  style: GoogleFonts.poppins(
                    color: const Color(0xFFD14D72),
                  ),
                ),
                InkWell(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFD14D72),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Add To Cart',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
