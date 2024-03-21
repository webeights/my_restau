import 'package:flutter/material.dart';
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
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.settings,
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const LocationWidget(),
            const SizedBox(
              height: 5,
            ),
            CustomTextField(
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
                          horizontal: 5,
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
                            radius: 4,
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
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
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
            Expanded(
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
                          style: const TextStyle(fontSize: 13),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
