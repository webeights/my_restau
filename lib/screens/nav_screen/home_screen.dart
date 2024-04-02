import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_restau/screens/cart_screen.dart';
import 'package:my_restau/widgets/custom_text_field.dart';
import 'package:my_restau/widgets/location_widget.dart';
import 'package:my_restau/data/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchEditingController = TextEditingController();
  final PageController _pageController = PageController(initialPage: 0);
  final List<bool> topRatedMenusButton = List.filled(
    favoriteFood.length,
    false,
  );

  favoriteButton(int index) {
    setState(() {
      topRatedMenusButton[index] = !topRatedMenusButton[index];

      topReatedMenu.add(favoriteFood[index]);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text('${favoriteFood[index].title} was added in favorite'),
        action: SnackBarAction(
          label: 'Done',
          onPressed: () {},
        ),
      ),
    );

    return;
  }

  int currentPageIndex = 0;

  final List<Widget> _pages = [
    Image.asset(
      'asset/images/steak.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'asset/images/shrimp.jpg',
      fit: BoxFit.fill,
    ),
    Image.asset(
      'asset/images/banner3.jpg',
      fit: BoxFit.fill,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 40),
        child: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Cart(
                      listOfItem: menu,
                    ),
                  ),
                );
              },
              icon: Image.asset(
                'asset/icon/cart-shopping-fast.png',
                color: const Color(0xFFD14D72),
                height: 20,
                width: 20,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const LocationWidget(),
              const SizedBox(
                height: 5,
              ),
              CustomTextField(
                contentPadding: const EdgeInsetsDirectional.only(start: 10),
                textEditingController: searchEditingController,
                keyboardType: TextInputType.name,
                hintText: 'Search',
                inputBorder: InputBorder.none,
                color: Colors.grey.shade200,
              ),
              const SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: PageView.builder(
                      itemCount: _pages.length,
                      controller: _pageController,
                      onPageChanged: (pages) {
                        setState(() {
                          currentPageIndex = pages;
                        });
                      },
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: _pages[currentPageIndex % _pages.length],
                          ),
                        );
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 9,
                    right: 0,
                    left: 305,
                    child: Row(
                      children: List<Widget>.generate(_pages.length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: InkWell(
                            onTap: () {
                              _pageController.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            },
                            child: CircleAvatar(
                              radius: 3.5,
                              backgroundColor: currentPageIndex == index
                                  ? Colors.pink
                                  : Colors.grey,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'categoriesScreen');
                    },
                    child: const Text(
                      'See All ',
                      style: TextStyle(
                        color: Color(0xFFD14D72),
                        fontSize: 13,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 89,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: categoryItems.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFD14D72).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            categoryItems[index]['images'] as String,
                            width: 28,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 18),
                          child: Text(
                            categoryItems[index]['name'] as String,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Text(
                'Top Reated Menus',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List<Widget>.generate(favoriteFood.length, (index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0 / 3),
                      child: ListTile(
                        leading: Image.asset(
                          favoriteFood[index].images,
                          width: 60,
                          height: 60,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              favoriteFood[index].title,
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.star,
                                  size: 15,
                                  color: Color(0xFFD14D72),
                                ),
                                Text(
                                  favoriteFood[index].ratings.toString(),
                                  style: GoogleFonts.poppins(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              favoriteFood[index].description,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${favoriteFood[index].amount.toStringAsFixed(2)}',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xFFD14D72),
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        favoriteButton(index);
                                      },
                                      child: topRatedMenusButton[index]
                                          ? const Icon(
                                              color: Color(0xFFD14D72),
                                              Icons.favorite,
                                              size: 18,
                                            )
                                          : const Icon(
                                              color: Color(0xFFD14D72),
                                              Icons.favorite_border_outlined,
                                              size: 18,
                                            ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        color: Color(0xFFD14D72),
                                        Icons.shopping_cart_checkout_rounded,
                                        size: 18,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
