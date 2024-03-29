import 'package:my_restau/models/menu_item.dart';

List<MenuItem> menu = [];

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
];

const List<MenuItem> favoriteFood = [
  MenuItem(
    title: 'Beef Steaw',
    images: 'asset/menu/beef_steaw.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '10-15',
    description: 'Lorem ipsum dolor sit amet,consect\nadipiscing elit, sed do.',
  ),
  MenuItem(
    title: 'Chicken Nuggets',
    images: 'asset/menu/chicken_nuggets.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '5-10 mins',
    description: 'Lorem ipsum dolor sit amet,consect\nadipiscing elit, sed do.',
  ),
  MenuItem(
    title: 'Chicken fries & Burger',
    images: 'asset/menu/chicken_fries_burger.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '10-13 mins',
    description: 'Lorem ipsum dolor sit amet,consect\nadipiscing elit, sed do.',
  ),
  MenuItem(
    title: 'Shrimp dried tempura',
    images: 'asset/menu/dried_shrimp.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '3-6 mins',
    description: 'Lorem ipsum dolor sit amet,consect\nadipiscing elit, sed do.',
  ),
  MenuItem(
    title: 'Fried Chicken',
    images: 'asset/menu/fried_chicken.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '15-20 mins',
    description: 'Lorem ipsum dolor sit amet,consect\nadipiscing elit, sed do.',
  ),
];

const List<MenuItem> menuItemList = [
  MenuItem(
    title: 'Barbeque Chicken',
    images: 'asset/menu/barbeque_chicken.png',
    amount: 20,
    ratings: 3,
    cookingTime: '15-20 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing, sed do eiusmod tempor incididunt ut labore et dolore magna aliquUnim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Barbeque Beef',
    images: 'asset/menu/beef_barbeque.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '10-15 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Beef Steaw',
    images: 'asset/menu/beef_steaw.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '10-15',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Chicken Nuggets',
    images: 'asset/menu/chicken_nuggets.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '5-10 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Combo Chicken\nfries & Burger',
    images: 'asset/menu/chicken_fries_burger.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '10-13 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Shrimp dried\ntempura',
    images: 'asset/menu/dried_shrimp.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '3-6 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Fried Chicken',
    images: 'asset/menu/fried_chicken.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '15-20 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Fried Shrimp',
    images: 'asset/menu/fried_shrimp.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '3-6 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Grilled Chicken',
    images: 'asset/menu/grilled_chicken.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '20-30 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Antipasti skewers',
    images: 'asset/menu/skewers.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '15-20 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Lemon Caridea',
    images: 'asset/menu/lemon_caridea_shrimp.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '13-18 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Pasta noodles',
    images: 'asset/menu/pasta_noodles_shrimp.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '5-10 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Antipasti board',
    images: 'asset/menu/antipasti_board.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '5-10 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Shrimp Curry',
    images: 'asset/menu/shrimp_curry.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '5-10 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Mixed Antipasti',
    images: 'asset/menu/mixed_antipasti.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '8-13 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Plate of Sea food',
    images: 'asset/menu/plate_of_sea_food.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '3-5 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
  MenuItem(
    title: 'Shrimp',
    images: 'asset/menu/shrimp.png',
    amount: 20,
    ratings: 4.5,
    cookingTime: '5-8 mins',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
  ),
];
