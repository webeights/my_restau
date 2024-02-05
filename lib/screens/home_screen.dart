import 'package:flutter/material.dart';
import 'package:my_restau/data/dummy_data.dart';
import 'package:my_restau/screens/login_screen.dart';
import 'package:my_restau/widgets/custom_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchMenu = TextEditingController();

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
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'asset/icon/bell.png',
              width: 20,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'asset/icon/settings.png',
              width: 20,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: DefaultTabController(
          length: 6,
          child: Column(
            children: [
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
                tabAlignment: TabAlignment.start,
                labelPadding: const EdgeInsetsDirectional.only(end: 30),
                physics: const AlwaysScrollableScrollPhysics(),
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
                  children: [
                    GridView.builder(
                      itemCount: listMenu.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.8,
                        crossAxisCount: 2,
                        mainAxisSpacing: 2,
                        crossAxisSpacing: 5,
                        mainAxisExtent: 220,
                      ),
                      itemBuilder: (context, index) {
                        return Card(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                color: Colors.amber,
                                child: Image.asset(
                                  listMenu[index].images,
                                  width: 120,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text: listMenu[index].title,
                                fontSize: 13,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Center(
                      child: Text('hello'),
                    ),
                    Center(
                      child: Text('hello'),
                    ),
                    Center(
                      child: Text('hello'),
                    ),
                    Center(
                      child: Text('hello'),
                    ),
                    Center(
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
