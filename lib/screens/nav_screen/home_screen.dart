import 'package:flutter/material.dart';
import 'package:my_restau/data/dummy_data.dart';
import 'package:my_restau/models/menu_item.dart';
import 'package:my_restau/screens/details_screen.dart';
import 'package:my_restau/screens/login_screen.dart';
import 'package:my_restau/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.listItem, super.key});

  final List<MenuItem> listItem;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchMenu = TextEditingController();
  List<bool> isAddToCart = List.filled(menuItemList.length, true);

  void saveMenuItem(MenuItem items) {
    setState(() {
      widget.listItem.add(items);
    });
  }

  List<String> listOfCategory = [
    'All',
    'Steak',
    'Pork',
    'Shrimp',
    'Drinks',
    'Cake'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: false,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'asset/icon/menu-burger.png',
            width: 20,
            color: const Color(0xFFD14D72),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'asset/icon/bell.png',
              width: 20,
              color: const Color(0xFFD14D72),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'asset/icon/settings.png',
              width: 20,
              color: const Color(0xFFD14D72),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: DefaultTabController(
          length: 6,
          child: Column(
            children: <Widget>[
              CustomTextField(
                textEditingController: searchMenu,
                keyboardType: TextInputType.name,
                hintText: 'Menu',
                prefixIcon: const Icon(Icons.search),
              ),
              const SizedBox(
                height: 10,
              ),
              TabBar(
                dividerHeight: 0,
                isScrollable: true,
                splashFactory: NoSplash.splashFactory,
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsetsDirectional.only(end: 30),
                physics: const BouncingScrollPhysics(),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: const Color(0xFFD14D72),
                tabs: listOfCategory.map((category) {
                  return TextWidget(
                    text: category,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    GridView.builder(
                      itemCount: menuItemList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.7,
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 220,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DetailsScreen(
                                    item: menuItemList[index],
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Center(
                                      child: Image.asset(
                                        menuItemList[index].images,
                                        height: 95,
                                        width: 95,
                                      ),
                                    ),
                                  ),
                                  TextWidget(
                                    text: menuItemList[index].title,
                                    fontSize: 13,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      const Icon(
                                        Icons.star,
                                        color: Color(0xFFD14D72),
                                        size: 17,
                                      ),
                                      TextWidget(
                                        text: menuItemList[index]
                                            .ratings
                                            .toString(),
                                        fontSize: 13,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextWidget(
                                          text:
                                              '\$${menuItemList[index].amount.toStringAsFixed(2)}',
                                          fontSize: 13,
                                        ),
                                        IconButton(
                                          highlightColor: Colors.transparent,
                                          splashColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          iconSize: 20,
                                          onPressed: () {
                                            setState(() {
                                              isAddToCart[index] =
                                                  !isAddToCart[index];
                                            });

                                            saveMenuItem(
                                              MenuItem(
                                                title:
                                                    menuItemList[index].title,
                                                images:
                                                    menuItemList[index].images,
                                                amount:
                                                    menuItemList[index].amount,
                                                ratings:
                                                    menuItemList[index].ratings,
                                                cookingTime: menuItemList[index]
                                                    .cookingTime,
                                                description: menuItemList[index]
                                                    .description,
                                              ),
                                            );
                                          },
                                          icon: isAddToCart[index]
                                              ? const Icon(
                                                  Icons
                                                      .favorite_outline_outlined,
                                                )
                                              : const Icon(
                                                  Icons.favorite,
                                                ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    const Center(
                      child: Text('hello'),
                    ),
                    const Center(
                      child: Text('hello'),
                    ),
                    const Center(
                      child: Text('hello'),
                    ),
                    const Center(
                      child: Text('hello'),
                    ),
                    const Center(
                      child: Text('hello'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
