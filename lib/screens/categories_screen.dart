import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});

  final List<Map<String, String>> categoryItems = [
    {
      'name': 'Soup',
      'images': 'asset/icon/soup.png',
    },
    {
      'name': 'Cake',
      'images': 'asset/icon/cake.png',
    },
    {
      'name': 'Drinks',
      'images': 'asset/icon/cocktail.png',
    },
    {
      'name': 'Salad',
      'images': 'asset/icon/salad.png',
    },
    {
      'name': 'Beef',
      'images': 'asset/icon/beef.png',
    },
    {
      'name': 'Coffee',
      'images': 'asset/icon/cofee.png',
    },
    {
      'name': 'Chicken',
      'images': 'asset/icon/chicken.png',
    },
    {
      'name': 'Seafood',
      'images': 'asset/icon/seafood.png',
    },
    {
      'name': 'Burger',
      'images': 'asset/icon/burger.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.keyboard_arrow_left),
        ),
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 325,
            child: GridView.builder(
              itemCount: categoryItems.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 90,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10 / 5,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xFFD14D72).withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          categoryItems[index]['images'] as String,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      categoryItems[index]['name'] as String,
                    ),
                  ],
                );
              },
            ),
          ),
          Divider(
            color: Colors.grey.shade400,
            thickness: 0.4,
          )
        ],
      ),
    );
  }
}
