import 'package:flutter/material.dart';
import 'package:my_restau/widgets/custom_text_field.dart';
import 'package:my_restau/widgets/location_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchEditingController = TextEditingController();

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
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: PageView(
                  children: const [
                    Center(
                      child: Text('Page 1'),
                    ),
                    Center(
                      child: Text('Page 2'),
                    ),
                    Center(
                      child: Text('Page 3'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
