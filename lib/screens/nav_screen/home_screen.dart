import 'package:flutter/material.dart';
import 'package:my_restau/widgets/custom_text_field.dart';
import 'package:my_restau/widgets/location_widget.dart';

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
    Image.asset('asset/images/banner.jpg'),
    Image.asset('asset/images/banner2.jpg'),
    Image.asset('asset/images/banner3.jpg'),
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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
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
                              duration: const Duration(microseconds: 600),
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
          ],
        ),
      ),
    );
  }
}
